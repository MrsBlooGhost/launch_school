# The `Todo` class represents a todo item and its associated data: name and a "done" flag to show whether the todo item is done.
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :done

  def initialize(title)
    @title = title
    @done = false
  end

  def done!
    self.done = true
  end

  def undone!
    self.done = false
  end

  def done?
    done
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    (title == otherTodo.title) && (done == otherTodo.done)
  end
end

# The `TodoList` class represents a collection of `Todo` objects. You can perform typical collection-oriented actions on objects of this class, such as iteration and selection.
class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # ----- Add to the list -----
  # Adds `todo` to the list; Returns list
  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of?(Todo)
    @todos << todo
  end

  # Same behavior as `#add`
  alias_method :<<, :add

  # ----- Interrogate the list -----
  # Returns number of items in list
  def size
    @todos.size
  end

  # Returns first item in list
  def first
    @todos.first
  end

  # Returns last item in list
  def last
    @todos.last
  end

  # Returns an array of all items in list
  def to_a
    @todos.clone
  end

  # Returns true if all todos in list are done, false otherwise
  def done?
    @todos.all? { |todo| todo.done? }
  end

  # ----- Retrieve item in list -----
  # Return item at specific index
  def item_at(index)
    @todos.fetch(index)
  end

  # Takes string as argument
  # Returns the first `Todo` object that matches argument; `nil` if no `Todo` found
  def find_by_title(search)
    select { |todo| todo.title == search }.first
  end

  # Returns new `TodoList` object containing only done items
  def all_done
    select { |todo| todo.done? }
  end

  # Returns new `TodoList` object containing only not done items
  def all_not_done
    select { |todo| !todo.done? }
  end

  # ----- Mark items in list -----
  # Marks an item as "done"
  def mark_done_at(index)
    item_at(index).done!
  end

  # Marks an item as "undone"
  def mark_undone_at(index)
    item_at(index).undone!
  end

  # Marks all items as "done"
  def done!
    @todos.each_index { |idx| mark_done_at(idx) }
  end

  # Takes a string as argument
  # Marks the first `Todo` object that matches the argument as done
  def mark_done(title)
    each { |todo| todo.done! if todo.title == task }
  end

  # Marks every `Todo` as done
  def mark_all_done
    each { |todo| todo.done! }
  end

  # Marks every `Todo` as not done
  def mark_all_undone
    each { |todo| todo.undone! }
  end

  # ----- Delete from list -----
  # Remove and return first item in list
  def shift
    @todos.shift
  end

  # Remove and return last item in list
  def pop
    @todos.pop
  end

  # Removes item at specified index
  def remove_at(index)
    @todos.delete(item_at(index))
  end

  # ----- Output the list -----
  # Returns string representation of list
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  # ---- #each ----
  # Returns the original `TodoList` object
  # Takes block; Yields each `Todo` object to block
  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  # ---- #select ----
  # Returns a new `TodoList` object which contains `Todo` objects that match the selection criteria
  # We use `TodoList#each` to iterate over the collection, then yield to the block, passing the current element to the block. If the return value of the block is truthy, we append the current element to the `results` array.
  def select
    new_obj = TodoList.new(title)
    each { |todo| new_obj.add(todo) if yield(todo) }
    new_obj
  end
  # ---- 
end

todo1 = Todo.new("Have dinner")
todo2 = Todo.new("Shower")
todo3 = Todo.new("Put baby to bed")
todo4 = Todo.new("Put baby to bed")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

list.mark_all_done
list.mark_all_undone

puts list
