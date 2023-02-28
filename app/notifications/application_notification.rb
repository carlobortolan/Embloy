# To deliver this notification:
#
# ApplicationNotification.with(post: @post).deliver_later(current_user)
# ApplicationNotification.with(post: @post).deliver(current_user)

class ApplicationNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, debug: true
  # deliver_by :action_cable, format: :to_action_cable
  deliver_by :email, mailer: "ApplicationMailer", if: :email_notifications?, unless: :read?, debug: true
  # deliver_by :email, mailer: "ApplicationMailer", if: :email_notifications?, delay: 15.minutes, unless: :read?, debug: true
  # deliver_by :slack
  # deliver_by DeliveryMethods::Discord

  def email_notifications?
    recipient.email_notifications?
  end

  def to_database
    {
      type: self.class.name,
      params: params,
      account: Current.account,
    }
  end

  # Add required params
  #
  param :application, :job

  # Define helper methods to make rendering easier.
  #
  def message
    @job = params[:job]
    @application = params[:application]
    @user = User.find(params[:job].user_id)
    "#{@user.first_name} applied for #{@job.title.truncate(10)}"
  end

  #
  def url
    job_path(params[:job])
  end
end
