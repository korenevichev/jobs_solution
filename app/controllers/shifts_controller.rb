class ShiftsController < ApplicationController

  def new
    @shift = Shift.new
    authorize! :manage, @shift
  end

  def create
    @shift = Shift.new(period: shift_params.dig('from')..shift_params.dig('to'))
    if @shift.save
      flash[:success] = 'Shift was added'
      redirect_to new_job_path
    else
      flash[:error] = 'Shift was not added'
      render 'new'
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:from, :to)
  end
end
