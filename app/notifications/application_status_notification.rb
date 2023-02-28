# To deliver this notification:
#
# ApplicationStatusNotification.with(post: @post).deliver_later(current_user)
# ApplicationStatusNotification.with(post: @post).deliver(current_user)

class ApplicationStatusNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :application, :job

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end

  #
  def url
    job_path(params[:job])
  end
end
