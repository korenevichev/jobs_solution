class JobsController < ApplicationController
  PER_PAGE = 10

  def index
    @jobs = params[:search].present? ? job_search_query : Job.all
    @jobs = @jobs.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def new
    authorize! :manage, Job
  end

  def create
    authorize! :manage, Job
    if Job.create!(title: job_params.dig('title'), languages: languages, shifts: shifts)
      flash[:success] = 'Job was added'
    else
      flash[:error] = 'Job was not added'
    end
    redirect_to jobs_path
  end

  def apply
    authorize! :read, Job
    id = params.dig('job_id')
    job = Job.find(id)
    redirect_to jobs_path, error: 'Job was not added' if current_user.jobs.include?(job)
    # current_user.jobs << job
    # current_user.save ? flash[:success] = 'was Applyed' : flash[:error] = 'not appluyf'
  end

  private

  def job_search_query
    Job.includes(:languages).where("languages.name ILIKE :search OR title ILIKE :search", search: "%#{search_param}%").references(:languages)
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
    params.require(:job).permit(:id, :title, languages: [], shifts: [])
  end
end
