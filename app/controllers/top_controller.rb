class TopController < ApplicationController

  def index
    @schedule = Schedule.new
    @schedule.host_plans_dates.build
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.individual_url = Digest::SHA1.hexdigest(Time.now.to_s)
    @schedule.save!
  end

  def show
    @schedule = Schedule.where(individual_url: params[:individual_url]).first
    @host_plans_dates = @schedule.host_plans_dates
    @plansdate_all_records = PlansDate.where(schedule_id: @schedule.id).all
    @plans_status_join = @plansdate_all_records.where(join_satus: Schedule::JOIN).all
    @plans_status_not_decided = @plansdate_all_records.where(join_satus: Schedule::NOT_DECIDED).all
    @plans_status_cant_join = @plansdate_all_records.where(join_satus: Schedule::CANT_JOIN).all
  end

  def thanx
    @schedule = Schedule.where(id: params[:schedule_id]).first
    params_start_day = params[:start_day]
    start_date= Date.new params_start_day["year"].to_i,
                         params_start_day["month"].to_i,
                         params_start_day["day"].to_i
    params_end_day = params[:end_day]
    end_date = Date.new params_end_day["year"].to_i,
                       params_end_day["month"].to_i,
                       params_end_day["day"].to_i
    @start_date_plus = start_date


    if start_date.month > end_date.month
      for m in start_date.month..12
        if m == start_date.month
          for d in start_date.day..@start_date_plus.end_of_month.day
            @the_created_day = Date.new @start_date_plus.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
          end
          @start_date_plus = @start_date_plus + 1.month
        elsif m == end_date.month
          for d in 1..end_date.day
            @the_created_day = Date.new @start_date_plus.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
          end
        else
          for d in 1..@start_date_plus.end_of_month.day
            @the_created_day = Date.new @start_date_plus.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
            @start_date_plus = @start_date_plus + 1.month
          end
        end
      end
      for m in 1..end_date.month
        if m == start_date.month
          for d in start_date.day..@start_date_plus.end_of_month.day
            @the_created_day = Date.new end_date.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
          end
          @start_date_plus = @start_date_plus + 1.month
        elsif m == end_date.month
          for d in 1..end_date.day
            @the_created_day = Date.new end_date.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
          end
        else
          for d in 1..@start_date_plus.end_of_month.day
            @the_created_day = Date.new end_date.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
            @start_date_plus = @start_date_plus + 1.month
          end
        end
      end
    else
      for m in start_date.month..end_date.month
        if m == start_date.month
          for d in start_date.day..@start_date_plus.end_of_month.day
            @the_created_day = Date.new @start_date_plus.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
          end
          @start_date_plus = @start_date_plus + 1.month
        elsif m == end_date.month
          for d in 1..end_date.day
            @the_created_day = Date.new @start_date_plus.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
          end
        else
          for d in 1..@start_date_plus.end_of_month.day
            @the_created_day = Date.new @start_date_plus.year.to_i, m.to_i, d.to_i
            HostPlansDate.create(host_nominated_day: @the_created_day, schedule_id: params[:schedule_id])
          end
          @start_date_plus = @start_date_plus + 1.month
        end
      end

      redirect_to top_path(@schedule)
    end

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
