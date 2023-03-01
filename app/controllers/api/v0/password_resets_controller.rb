# frozen_string_literal: true
module Api
  module V0
    class PasswordResetsController < ApplicationController
      def create
        if request.headers["HTTP_ACCESS_TOKEN"].nil?
          render status: 400, json: { "access_token": [
            {
              "error": "ERR_BLANK",
              "description": "Attribute can't be blank"
            }
          ]
          }
        else
          begin
            decoded_token = AuthenticationTokenService::Access::Decoder.call(request.headers["HTTP_ACCESS_TOKEN"])[0]
            if UserRole.must_be_verified(decoded_token["typ"])
              user = User.find_by(id: decoded_token["sub"].to_i)
              PasswordMailer.with(user: user).reset.deliver_later
              render status: 200, json: { "message": "Password reset process successfully initiated! Please check your mailbox." }
            else
              render status: 403, json: { "user": [
                {
                  "error": "ERR_INACTIVE",
                  "description": "Attribute is blocked."
                }
              ]
              }
            end
          rescue AuthenticationTokenService::InvalidInput::Token
            render status: 400, json: { "access_token": [
              {
                "error": "ERR_INVALID",
                "description": "Attribute is malformed or unknown."
              }
            ]
            }
          rescue JWT::ExpiredSignature
            render status: 401, json: { "access_token": [
              {
                "error": "ERR_INVALID",
                "description": "Attribute has expired."
              }
            ]
            }
          rescue JWT::InvalidIssuerError
            render status: 401, json: { "access_token": [
              {
                "error": "ERR_INVALID",
                "description": "Attribute was signed by an unknown issuer."
              }
            ]
            }
          rescue JWT::VerificationError
            render status: 401, json: { "access_token": [
              {
                "error": "ERR_INVALID",
                "description": "Token can't be verified."
              }
            ]
            }
          rescue JWT::IncorrectAlgorithm
            render status: 401, json: { "access_token": [
              {
                "error": "ERR_INVALID",
                "description": "Token was encoded with an unknown algorithm."
              }
            ]
            }
          rescue JWT::DecodeError
            render status: 400, json: { "access_token": [
              {
                "error": "ERR_INVALID",
                "description": "Attribute is malformed or unknown."
              }
            ]
            }

          end
        end
      end

      def edit
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
      end

      def update
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
        if @user.update(password_params)
          redirect_to sign_in_path, notice: 'Your password was reset successfully. Please sign in.'
        else
          render :edit
        end
      end

      private

      def password_params
        params.require(:user).permit(:password, :password_confirmation)
      end
    end
  end
end