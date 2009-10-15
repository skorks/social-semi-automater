class TimeIntervalGenerator
  def self.generate_random_interval(min_interval_seconds, max_interval_seconds)
    min_interval_seconds + rand(max_interval_seconds-min_interval_seconds)
  end

  def self.wait_until_submission_possible
    seconds = generate_random_interval 600, 660
    $LOG.info "waiting for #{seconds} seconds"
    sleep(seconds)
  end

  def self.wait_for_next_submission
    seconds = generate_random_interval 600, 900
    $LOG.info "waiting for #{seconds} seconds"
    sleep(seconds)
  end
end
