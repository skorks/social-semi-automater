require 'rubygems'
require 'logger'
require 'selenium'
require 'browser'
require 'pages/reddit'
require 'submissions/submission'
require 'submissions/submission_store'
require 'submissions/submission_store_factory'
require 'time_interval_generator'

$LOG = Logger.new(STDOUT)
$LOG.level = Logger::INFO

browser = Browser.new
browser.start

reddit_page = Reddit.new browser.browser_driver
reddit_page.login 'servercentric', 'servercentric123'
submission_store = SubmissionStoreFactory.create_submission_store("D:\\ruby-projects\\social_semi_automater\\submissions.txt")

if(reddit_page.submitting_too_fast)
  $LOG.info "submitting too fast, waiting for 10 minutes before submitting"
  TimeIntervalGenerator.wait_until_submission_possible
end

submission_store.each do |submission|
  begin
    $LOG.info "attempting to submit #{submission.url}"
    reddit_page.submit_if_not_already_submitted submission
  rescue Exception => e
    $LOG.error "Error submitting url - #{submission.url}: #{e}"
  end
end

browser.stop

$LOG.close

