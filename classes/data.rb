require_relative './file_reader'
require_relative './file_writer'

class Data
  def self.save_to_file(content, file_name)
    FileWriter.new(content, file_name).write
  end

  def self.read_from_file(file_name)
    FileReader.new(file_name).read
  end
end