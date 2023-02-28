class UserController < ApplicationController
  before_action :require_user_logged_in!

  def index
    if require_user_logged_in!
      @user = Current.user
      @user.update(view_count: @user.view_count + 1)
      # @jobs = @user.jobs.includes(:rich_text_body).order(created_at: :desc)
      @jobs = @user.jobs.order(created_at: :desc)
      @total_job_views = 0

      @jobs.each do |job|
        @total_job_views += job.view_count
      end
    end
  end

  def settings
    if require_user_logged_in!
      @user = Current.user
    end
  end

  def edit
    if require_user_logged_in!
      @user = Current.user
    end
  end

  def own_jobs
    if require_user_logged_in!
      # @jobs = @user.jobs.includes(:rich_text_body).order(created_at: :desc)
      @jobs = Current.user.jobs.order(created_at: :desc)
      # @jobs = Job.all.where("user_id = #{Current.user.id}")
    end
  end

  def own_applications
    if require_user_logged_in!
      # @applications = Application.find_by_applicant_id(Current.user.id)
      # @applications = @application_service.find_by_user(Current.user.id).as_json
      @applications = Application.includes(:user).all.where("user_id = #{Current.user.id}")
    end
  end

end

