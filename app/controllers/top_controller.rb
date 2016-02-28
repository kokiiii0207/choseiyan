class TopController < ApplicationController

  def index
    @schedule = Schedule.new
    @schedule.host_plans_dates.build
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save!

  end

  def thanx
    @start_day = params[:start_day].values[2]
    @end_day = params[:end_day].values[2]
    raise
  end


  private
  def schedule_params
    params.require(:schedule).permit(:title, :comment, :individual_url,
      host_plans_dates_attributes: [:id, :schdule_id, :host_nominated_day])
  end

  # def host_plans_dates_params
  #   params.require(:host_plans_date).permit(:host_nominated_day)
  # end
end
