class ClockEvent < ApplicationRecord
  belongs_to :user
  validate :check_clock_in_event, on: :create
  validate :check_clock_out_event, on: :update


  private

  def check_clock_in_event
    errors.add(:clock_in, 'exists') if user.clock_events.where(stop_at: nil).present?
  end

  def check_clock_out_event
    errors.add(:clock_in, 'does not exist') if user.clock_events.where(stop_at: nil).blank?
  end
end
