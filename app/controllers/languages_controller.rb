class LanguagesController < ApplicationController

  def new; end

  def create
    @job = Language.new(language_params)
    @job.save ? flash[:success] = 'Job was added' : flash[:error] = 'Job was not added'
    redirect_to jobs_path
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end
end
