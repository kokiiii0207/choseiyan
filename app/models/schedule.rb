class Schedule < ActiveRecord::Base
  has_many :host_plans_dates
  accepts_nested_attributes_for :host_plans_dates
end
