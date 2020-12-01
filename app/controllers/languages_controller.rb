class LanguagesController < ApplicationController

  def new
    @language = Language.new
    authorize! :manage, @language
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      flash[:success] = 'Job was added'
      redirect_to new_job_path
    else
      flash[:error] = 'Job was not added'
      render 'new'
    end
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end
end
