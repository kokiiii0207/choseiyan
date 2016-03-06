class Schedule < ActiveRecord::Base
  has_many :host_plans_dates
  accepts_nested_attributes_for :host_plans_dates

  JOIN       = 0
  NOT_DECIDE = 1
  CANT_JOIN  = 2

  JOIN_STATUS_HASH = {
    JOIN       => "◯",
    NOT_DECIDE => "△",
    CANT_JOIN  => "×"
  }

  def to_param
    return individual_url
  end
end
