class Job < ApplicationRecord
  include Visible
  belongs_to :user, counter_cache: true

  has_many :applications, dependent: :delete_all
  has_many :notifications, dependent: :delete_all
  has_many :notifications, through: :user, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :start_slot, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  def profile
    @job.update(view_count: @job.view_count + 1)
  end
end
