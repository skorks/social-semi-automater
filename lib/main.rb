require 'selenium'
require 'browser'
require 'pages/reddit'
require 'submissions/submission'
require 'submissions/submission_store'
require 'submissions/submission_store_factory'
require 'time_interval_generator'

browser = Browser.new
browser.start

reddit_page = Reddit.new browser.browser_driver
reddit_page.login 'servercentric', 'servercentric123'
submission_store = SubmissionStoreFactory.create_submission_store("D:\\ruby-projects\\temp\\social-running\\submissions.txt")

submission_store.each do |submission|
  reddit_page.submit submission
#  sleep(TimeIntervalGenerator.generate_random_interval 10, 20)
  sleep(TimeIntervalGenerator.generate_random_interval 600, 1200)
end

browser.stop

# TODO
# rake task to build project
# rake task to start/stop selenium server
# rake task to run project
