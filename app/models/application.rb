class Application < ApplicationRecord
  after_create_commit :notify_recipient
  after_update_commit :notify_applicant
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  # has_rich_text :application_text

  belongs_to :job, counter_cache: true
  belongs_to :user, :dependent => :destroy, counter_cache: true

  # validates :applicant_id, presence: true
  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :application_text, presence: true, length: { minimum: 10 }

  def notify_recipient
    return if job.user.eql? user
    ApplicationNotification.with(application: [:user_id, :job_id], job: job).deliver_later(job.user)
  end

  def notify_applicant
    return if job.user.eql? user
    ApplicationStatusNotification.with(application: [:user_id, :job_id], job: job).deliver_later(job.user)
  end

  private

  def cleanup_notifications
    notifications_as_application.destroy_all
  end
end
