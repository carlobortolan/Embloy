class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_notifications, if: Current.user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    if Current.user.nil?
      redirect_to sign_in_path, alert: 'You must be logged in!'
      return false
    end
    true
  end

  def require_user_be_owner!
    if Current.user.nil? || @job.nil? || @job.user_id != Current.user.id
      redirect_back(fallback_location: jobs_path, alert: 'Not allowed!')
      # job_path(@job), status: :unauthorized, alert: 'Not allowed'
      return false
    end
    true
  end

  # rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ::NameError, with: :err_server
  # rescue_from ::NoMethodError, with: :err_server
  # rescue_from ::ActionController::InvalidAuthenticityToken, with: :err_not_allowed
  # rescue_from ::ActionController::RoutingError, with: :err_server
  # rescue_from ::AbstractController::DoubleRenderError, with: :err_server

  protected

  def err_server
    render(:file => File.join(Rails.root, 'public/500.html'), :status => 500, :layout => false)
  end

  def err_not_allowed
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  def record_not_found(exception)
    if Current.user
      # && Current.user.role == 'Admin'
      render json: { error: exception.message }.to_json, status: 404
    else
      err_not_allowed
    end
  end

  def routing_error(exception)
    render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
  end

  private

  def set_notifications
    notifications = Notification.includes(:recipient).where(recipient: Current.user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end

end