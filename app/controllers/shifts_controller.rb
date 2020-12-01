class ShiftsController < ApplicationController

  def new
    @shift = Shift.new
    authorize! :manage, @shift
  end

  def create
    authorize! :manage, Shift
    @shift = Shift.new(from: from, to: to, period: from..to)
    if @shift.save
      flash[:success] = 'Shift was added'
      redirect_to new_job_path
    else
      flash[:error] = 'Shift was not added'
      render 'new'
    end
  end

  private

  def from
    shift_params.dig('from').to_time
  end

  def to
    shift_params.dig('to').to_time
  end

  def shift_params
    params.require(:shift).permit(:from, :to)
  end
end
