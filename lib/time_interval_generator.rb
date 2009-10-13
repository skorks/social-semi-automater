class TimeIntervalGenerator
  def self.generate_random_interval(min_interval_seconds, max_interval_seconds)
    min_interval_seconds + rand(max_interval_seconds-min_interval_seconds)
  end
end
