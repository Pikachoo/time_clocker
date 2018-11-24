class HomeController < ApplicationController

  def index
    @clock_events = current_user.clock_events.order(start_at: :desc)
  end
end
