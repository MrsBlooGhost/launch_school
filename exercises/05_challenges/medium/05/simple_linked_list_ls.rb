# Each instance of `Element` has the attributes `datum` and `next`. We use the `next` attribute along with other instances of `Element` in order to build the linked list.
# The `SimpleLinkedList` class uses its own `push` and `pop` methods to add and remove elements from the front of the list (LIFO).
  # We must re-assign the `head` attribute each time an element is added to or removed from the linked list.
# `SimpleLinkedList#peek` returns the data value of the head element, if one exists.
# `SimpleLinkedList#to_a` creates a new empty array, then repeatedly adds the datum value of each element on the linked list to the array. 
# `SimpleLinkedList::from_a` creates a new list, then adds the elements from the array to the list, one at a time, in reverse order.
# `SimpleLinkedList#reverse` works similarly to `SimpleLinkedList::from_a`.

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    current_elem = head
    while !current_elem.nil?
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end

  def reverse
    list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end
end