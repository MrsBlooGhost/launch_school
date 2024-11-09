# We know the desired output; we must somehow produce it.
# Starting with the `process` method, we know that it should read text from a file, then pass that text to the block for further processing. The usual approach for read-and-process code looks like this:

file = File.open('sample_text.txt', 'r')
# do processing
file.close

# Since we're passing the text content of the file to the block, we load it and call the block with `yield(file.read)`.
# We now have "sandwich code", which performs some pre- and post-processing for some arbitrary action. 

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

# Because we're passing text to the block, the blocks capture that text. 

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split().count} words" }