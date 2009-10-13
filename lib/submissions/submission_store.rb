class SubmissionStore
  def initialize
    @submissions = []
  end

  def <<(submission)
    @submissions << submission
  end

  def each
    @submissions.each do |submission|
      yield(submission)
    end
  end
end