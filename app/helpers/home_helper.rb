module HomeHelper
  def period(clock_event)
    stop_at = clock_event.stop_at ? clock_event.stop_at : Time.zone.now
    diff = stop_at - clock_event.start_at
    hours = (diff / 1.hour).round
    minutes = ((diff / 1.minutes) - hours * 60).round

    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
  end
end
