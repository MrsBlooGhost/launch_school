# We are missing a `Device#listen` method and a `Device#play` method. 
# We implement the `Device#listen` method by yielding to the block, then recording what was in that block if necessary.
# We include `return unless block_given?` to handle the situation where a block isn't provided to `Device#listen`. If we don't include it, we get a `LocalJumpError`.
# `listen` refactored: We use a guard clause in the `listen` method to handle the no-block case. 
# In the `play` method, we output what was last recorded. If nothing was recorded, we output nothing.

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    message = yield if block_given?
    record(message) if message
  end

  # refactored `listen` method
  def listen
    return unless block_given?
    message = yield
    record(message)
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"