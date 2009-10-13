class SubmissionStoreFactory
  def self.create_submission_store(submission_file_path)
    submission_store = SubmissionStore.new
    populate_store(submission_file_path) do |submission|
      submission_store << submission
    end
    submission_store
  end

  private
  
  def self.populate_store(submission_file_path)
    File.open(submission_file_path, "r").each do |line|
      url,title,tag = parse_line(line)
      yield Submission.new(url, title, tag)
    end
  end

  def self.parse_line(line)
    line.split(",").map do |item|
      item.strip.gsub("\"", '')
    end
  end
end
