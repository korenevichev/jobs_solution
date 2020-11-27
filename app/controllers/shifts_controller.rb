class ShiftsController < ApplicationController

  def new; end

  def create
    binding.pry
    @shift = Shift.new(period: shift_params.dig('from')..shift_params.dig('to'))
    @shift.save ? flash[:success] = 'Job was added' : flash[:error] = 'Job was not added'
    redirect_to jobs_path
  end

  private

  def shift_params
    params.require(:shift).permit(:from, :to)
  end
end
