# @author Jan Hummel, Carlo Bortolan
require_relative '../../lib/notification_generator.rb'
require_relative '../../lib/notification_generator.rb'

class ApplicationService
  attr_accessor(:application_repository, :notification_generator)

  # Rejects single application and adds optional comment by employer.
  def reject (job_id, user_id, comment) end

  # Rejects all applications.
  def reject_all (job_id, comment) end

  # Accepts single application and adds optional comment by employer.
  # Sends notification message to accepted applicant.
  # Rejects all other pending applications for this job.
  def accept (job_id, user_id, comment)
    @notification_generator.send_notification_applicant(applicant[:name], applicant[:email], job_id, comment)
  end
end

