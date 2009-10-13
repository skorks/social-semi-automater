class Submission
  attr_reader :url, :title, :tag
  def initialize(url, title, tag)
    @url = url
    @title = title
    @tag = tag
  end
end
