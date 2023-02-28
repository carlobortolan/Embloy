class ApplicationsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_job
  attr_accessor(:application_service, :user_service)
  layout 'job_applic_layout'

  # def initialize
  #   super
  #   @application_service = ApplicationService.new(nil, nil)
  #   @user_service = UserService.new
  # end

  def index
    @job = Job.find(params[:job_id])
    require_user_be_owner!
    @applications = @job.applications.includes(:user).all
  end

  def show
    # require_user_be_owner!
    @job = Job.find(params[:job_id])
    # @application = @job.applications.find_by_sql("SELECT * FROM applications a WHERE a.user_id = #{params[:id]} and a.job_id = #{params[:job_id]}")
    @application = @job.applications.find_by_sql("SELECT * FROM applications a WHERE a.user_id = #{1} and a.job_id = #{1}")
  end

  def new
    require_user_logged_in!
    @job = Job.find(params[:job_id])
    @application = Application.new
  end

  def create
    if require_user_logged_in!
      @job = Job.find(params[:job_id])
      begin
        @application = Application.create!(
          user_id: Current.user.id.to_i,
          job_id: params[:job_id].to_i,
          application_text: application_params[:application_text],
          application_documents: application_params[:application_documents],
          applied_at: Time.now
        )
        @application.user = User.find(Current.user.id.to_i)
        @application.save!
        redirect_to job_path(@job), notice: 'Application has been submitted'
      rescue
        redirect_to job_path(@job), alert: 'Application could not be submitted'
      end
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    if require_user_be_owner!
      redirect_to job_path(@job), alert: 'You are not the owner of this job!' if Current.user.id != @job.user_id
      @application = @job.applications.find(params[:user_id])
      @application.destroy

      redirect_to job_path(@job), status: :see_other
    end
  end

  def accept
    @job = Job.find(params[:job_id])
    if require_user_be_owner!
      @application_service.accept(params[:job_id].to_i, params[:application_id].to_i, "ACCEPTED")
      redirect_to job_path(@job), status: :see_other
    end
  end

  def reject
    @job = Job.find(params[:job_id])
    if require_user_be_owner!
      @application_service.reject(params[:job_id].to_i, params[:application_id].to_i, "REJECTED")
      redirect_to job_applications_path(params[:job_id])
    end
  end

  def reject_all
    @job = Job.find(params[:job_id])
    if require_user_be_owner!
      @application_service.reject_all(params[:job_id].to_i, "REJECTED")
      redirect_to job_path(@job), status: :see_other

    end
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def application_params
    params.require(:application).permit(:user_id, :application_text, :application_documents)
  end
end
