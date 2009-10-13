class Reddit
  def initialize(browser)
    @browser=browser
    go_home
  end

  def login(username, password)
    @browser.type 'user', username
    @browser.type 'passwd', password
    @browser.click "xpath=//button[text()='login']"
    @browser.wait_for_page_to_load
  end

  def go_home
    @browser.open 'http://www.reddit.com/'
    @browser.wait_for_page_to_load
  end

  def submit(submission)
    go_to_submission_page
    submit_story submission.url, submission.title, submission.tag
    go_home
  end

  def go_to_submission_page
    @browser.click "xpath=//a[@href='http://www.reddit.com/submit']"
    @browser.wait_for_page_to_load
  end

  def submit_story(url, title, sub_reddit='reddit.com')
    @browser.type 'url', url
    @browser.type "xpath=//textarea[@name='title']", title
    @browser.type 'sr', sub_reddit
    @browser.click "xpath=//button[@name='submit']"
    @browser.wait_for_page_to_load
  end
end
