class JobNotification < ApplicationRecord
  include Noticed::Model
  belongs_to :job

  validates :employer_id, presence: true
  validates :job_id, presence: true
  validates :notify, presence: true
end
