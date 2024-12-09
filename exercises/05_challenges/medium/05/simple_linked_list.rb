=begin
--- P
Task: Write a singly linked list implementation. 
Create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide methods to reverse the linked list and convert a linked list to and from an array.

Input: integer or instances of class `LinkedList`
Return:
Intermediate: store input in array?

Rules:
- Each element in the list contains data and a "next" field pointing to the next element in the list of elements. 
--- E

--- D

--- A-Broad
### class `Element`

constructor
- accepts two arguments, integer and an instance of `Element`. save in `@datum` and `@next_el`.
  - if second argument isn't passed, use default value of `nil`.

instance method `datum`
- returns value of `@datum`

instance method `tail?`
- returns boolean indicating if @next_el is nil

instance method `next`
- returns value of `@next`

### class `SimpleLinkedList`

constructor
- expects no arguments
- intializes `@list` instance variable to an empty array

instance method `size`
- returns integer representing size of `@list`

instance method `empty?`
- returns boolean value indicating if `@list` is empty

instance method `push`
- accepts integer as argument
- instantiate new `Element` object, passing in given integer and element at index (list size) as arguments
- prepends the object to list

instance method `pop`
- removes element at index 0
- returns the value of `@datum` of removed element

instance method `head`
- returns element index 0 of list

instance method `peek`
- returns value of `@datum` of element at index 0 of `@list` unless list is empty

class method `from_a`
- accepts array or nil as argument
- convert from an array to a linked list
- instantiate object of `SimpleLinkedList`, save in local variable `new_list`
- return `new_list`


  - re-assign array to an empty array if `nil` is argument

- iterate through given array in reverse order, accessing each element
  - call `push` on new object

instance method `to_a`
- initialize result array
- iterate through object's list, accessing each element.
  - call `datum` getter method on current element to retrieve its datum, and append it to result array
- return result array

instance method `reverse`
- destructively reverse list array

--- A-Detailed

=end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next_el.nil?
  end
end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(num)
    data = Element.new(num, list[0])
      # push element to list of 10 items --> items at indices 0-9
      # item 11 --> num 11 --> idx 0
    list.prepend(data)
  end

  def pop
    list.delete_at(0).datum
  end

  def head
    list[0]
  end

  def peek
    list[0].datum unless list.empty?
  end

  def self.from_a(arr)
    arr = [] if arr.nil?
    new_list = new
    arr.reverse_each { |number| new_list.push(number) }
    new_list

    
  end

  def to_a
    result = []
    list.each { |el| result.append(el.datum) }
    result
  end

  def reverse
    list.reverse
    # self
  end
end

list = SimpleLinkedList.new
(1...5).each do |datum|
  list.push(datum)
end
p list