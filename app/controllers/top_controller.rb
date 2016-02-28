class TopController < ApplicationController

  def index
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save!
    
  end


  private
  def schedule_params
    params.require(:schedule).permit(:title, :comment, :individual_url)
  end
end
