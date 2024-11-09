# `test_swap`:
# Any code that's necessary to setup the test should go in the `#setup` method. Here, we open the sample text file for reading.
# To write the test, we first create an instance of class `Text` and pass it text. In order to do this, we'll have to read the text from the sample text file.
# Then, we make the command, `Text#swap`, that will lead to the assertion for this test. The return value of `Text#swap` is what we'll use to test that this method is working as intended.
# We need a string that we can test against the return value of `Text#swap`. This will be our expected value for the later assertion. To get this string, we take the contents of the file and process it manually to replace every "a" with an "e".
# Finally, we use `assert_equal` to ensure that the expected value of the text is equal to the actual value. 

# `test_word_count`:
# We first need to determine the word count of the sample text. We can do this by calling the `word_count` method manually or by reading the file in irb and counting the words from there. We then write in that value into our test as the expected value.
# We also need to make sure that we read the file to gain access to the relevant text. We're able to call `@file.read` since the opening of our file is handled in the `setup` method. If we didn't first open that file, then calling `@file.read` would throw an error. 
# Lastly, we use `assert_equal` with our hard-coded word count and a call to `text.word_count` as arguments.
# In regards to our `teardown` method, Ruby can be lenient when it comes to closing files. If we didn't call `@file.close`, then the `File` object associated with `@file` would be closed when our script is finished running. This is a failsafe implemented by the `IO` class. It is best, though, to be explicit about these things.
# We can add one more line of code to our test file to verify that teardown is called after each test. We'll use the predicate method `closed?` to verify that we have closed our file.

require 'minitest/autorun'
require_relative 'text'

class TestText < Minitest::Test
  attr_reader :file

  def setup
    @file = File.open('sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual = text.swap('a', 'e')
    expected = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected, actual)
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal(72, text.word_count)
  end

  def teardown
    file.close
  end
end