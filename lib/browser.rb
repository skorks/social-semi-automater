class Browser
  attr_reader :browser_driver
  def initialize
    @browser_driver = Selenium::Client::Driver.new(:host => "localhost",
      :port => 4444,
      :browser => "*firefox",
      :timeout_in_seconds => 30,
      :url => "http://www.google.com/")
  end

  def start
    @browser_driver.start
  end

  def stop
    @browser_driver.stop
  end
end
