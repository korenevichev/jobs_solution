class JobsController < ApplicationController
  PER_PAGE = 10

  def index
    @jobs = Rails.cache.fetch('jobs', expires_in: 15.minutes) do
      job_search_query
    end.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def new
    @job = Job.new
    authorize! :manage, @job
  end

  def create
    authorize! :manage, Job
    @job = Job.new(title: job_params[:title],
                   salary_per_hour: job_params[:salary_per_hour],
                   languages: languages,
                   shifts: shifts)
    if @job.save
      flash[:success] = 'Job was added'
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def apply
    authorize! :read, Job
    job = Job.find(params[:job_id])
    job.with_lock { job.users << current_user }
    flash[:success] = 'Applied'
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'You have already applied'
  ensure
    redirect_to jobs_path
  end

  private

  def job_search_query
    scope = if params[:search].present?
              Job.where("languages.name ILIKE :search OR title ILIKE :search", search: "%#{search_param}%")
                .references(:languages)
            else
              Job.all
            end
    scope.includes(:languages, :shifts).order(:id)
  end

  def search_param
    params[:search][:job]
  end

  def shifts
    Shift.where(id: job_params[:shifts])
  end

  def languages
    Language.where(id: job_params[:languages])
  end

  def job_params
    params.require(:job).permit(:id, :title, :salary_per_hour, languages: [], shifts: [])
  end
end
