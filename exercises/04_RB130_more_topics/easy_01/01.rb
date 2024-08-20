# To provide most of the functionality of the Enumerable module, include `Enumerable` in your class, and define an `each` method that yields each member of the collection one at a time.

class Tree
  include Enumerable

  def each
    # implementation for Tree objects
  end
end