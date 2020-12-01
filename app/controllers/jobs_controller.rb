class JobsController < ApplicationController
  PER_PAGE = 10

  def index
    @jobs = params[:search].present? ? job_search_query : Job.all
    @jobs = @jobs.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def new
    @job = Job.new
    authorize! :manage, @job
  end

  def create
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
    id = params.dig('job_id')
    job = Job.find(id)
    job.users << current_user ? flash[:success] = 'Applied' : flash[:error] = 'You have already applied'
  end

  private

  def job_search_query
    Job.includes(:languages).
      where("languages.name ILIKE :search OR title ILIKE :search", search: "%#{search_param}%").
      references(:languages)
  end

  def search_param
    params[:search][:job]
  end

  def shifts
    shift_ids = job_params.dig('shifts')
    Shift.where(id: shift_ids)
  end

  def languages
    language_ids = job_params.dig('languages')
    Language.where(id: language_ids)
  end

  def job_params
    params.require(:job).permit(:id, :title, :salary_per_hour, languages: [], shifts: [])
  end
end
