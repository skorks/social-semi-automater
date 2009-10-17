require 'rake'
require 'selenium/rake/tasks'

Selenium::Rake::RemoteControlStartTask.new do |rc|
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
  rc.background = true
  rc.wait_until_up_and_running = true
  rc.jar_file = "../resources/selenium-server.jar"
  rc.additional_args << "-singleWindow"
end

Selenium::Rake::RemoteControlStopTask.new do |rc|
  rc.host = "localhost"
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
end

class SeleniumServerController
  def self.start_selenium_server
    Rake::Task[:'selenium:rc:start'].execute []
  end

  def self.stop_selenium_server
    Rake::Task[:'selenium:rc:stop'].execute [] rescue nil
  end
end
