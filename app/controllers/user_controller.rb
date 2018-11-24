class UserController < ApplicationController

  def clock_in
    clock_event = ClockEvent.create(start_at: Time.zone.now, user_id: current_user.id)

    flash[:error] = clock_event.errors.full_messages.to_sentence if clock_event.errors.present?
    redirect_to root_path
  end

  def clock_out
    clock_event = current_user.clock_events.order(start_at: :desc).first
    clock_event.update(stop_at: Time.zone.now)

    flash[:error] = clock_event.errors.full_messages.to_sentence if clock_event.errors.present?
    redirect_to root_path
  end
end
