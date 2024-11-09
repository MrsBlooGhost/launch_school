# RB 130 - Ruby Foundations: More Topics

## Easy Testing

### 1 - Boolean Assertions

**Question:**

Write a minitest assertion that will fail if `value.odd?` is not true.

**Solution:**

```ruby
assert_equal true, value.odd?
```

**Discussion:**

- `#assert_equal` can be used to ensure the exact value returned is `true`, rather than just any truthy value.

**Alternative approach:**

```ruby
assert value.odd?, 'value is not odd'
```

**Discussion:**

- `#assert(test, msg = nil)` checks if its first argument is truthy (not `false` or `nil`). If it's not truthy, the assertion fails and displays the second argument as a custom failure message. 
- Though a custom message is optional for most assertions, it's often added for `assert` since its default message may lack context.

---
### 2 - Equality Assertions

**Question:**

Write a minitest assertion that will fail if `value.downcase` does not return `'xyz'`.

**Solution:**

```ruby
assert_equal('xyz', value.downcase)
```

**Discussion:**

- **`#assert_equal`** checks if its first two arguments are equal using **`#==`**.
- By convention, the first argument represents the **expected value** (`'xyz'`), and the second argument represents the **actual value** (`value.downcase`).
- Following this convention ensures that failure messages are clear and logical.

---
### 3 - Nil Assertions

**Question:**

Write a minitest assertion that will fail if `value` is not `nil`.

**Solution:**

```ruby
assert_nil(value)
```

---
### 4 - Empty Object Assertions

**Question:**

Write a minitest assertion that will fail if the Array `list` is not empty.

**Solution:**

```ruby
assert_empty(list)
```

**Discussion:**

- **`assert_empty`** checks if the given object is empty by calling its **`#empty?`** method. If `list` is not empty, the assertion fails.
- Although **`assert_equal(true, list.empty?)`** could be used, **`assert_empty`** is clearer and provides a more helpful failure message.
- **`assert(list.empty?)`** could work as a viable solution, as it checks if `list.empty?` returns a truthy value. If `list` is empty, the test will pass; if not, it will fail. However, while this approach is functionally correct, it may lack the clarity and helpful failure messaging that `assert_empty` provides.

---
### 5 - Included Object Assertions

**Question:**

Write a minitest assertion that will fail if `'xyz'` is not in the Array `list`.

**Solution:**

```ruby
assert_includes(list, 'xyz')
```

**Discussion**: 

- `#assert_includes` checks whether the first argument contains the second argument. 
- Although **`assert_equal true, list.include?('xyz')`** could work, `assert_includes` is preferable because it is clearer and provides a more helpful failure message if the test fails.

---
### 6 - Exception Assertions

**Question:**

Write a minitest assertion that will fail unless `employee.hire` raises a `NoExperienceError` exception.

**Solution:**

```ruby
assert_raises(NoExperienceError) { employee.hire }
```

**Discussion**: 
- `#assert_raises` verifies if the block raises an exception of the specified type. If the block does not raise the specified exception, the assertion fails.

---
### 7 - Type Assertions

**Question:**

Write a minitest assertion that will fail if `value` is not an instance of the `Numeric` class exactly. `value` may not be an instance of one of `Numeric`'s superclasses.

**Solution:**

```ruby
assert_instance_of(Numeric, value)
```

**Discussion:** 
- **`#assert_instance_of`** uses `Object#instance_of?` to confirm that its second argument is an exact instance of the class specified in the first argument.

---
### 8 - Kind Assertions

**Question:**

Write a minitest assertion that will fail if the class of `value` is not `Numeric` or one of `Numeric`'s subclasses (e.g., `Integer`, `Float`, etc).

**Solution:**

```ruby
assert_kind_of(Numeric, value)
```

**Discussion**: 
- **`#assert_kind_of`** uses `Object#kind_of?` to confirm that its second argument is an instance of the specified class or any subclass of it.

---
### 9 - Same Object Assertions

**Question:**

Write a test that will fail if `list` and the return value of `list.process` are different objects.

**Solution:**

```ruby
assert_same(list, list.process)
```

**Discussion**: 
- **`#assert_same`** checks if its first and second arguments refer to the exact same object, using `#equal?`.

---
**10 - Refutations**

**Question:**

Write a test that will fail if `'xyz'` is one of the elements in the Array `list`.

**Solution:**

```ruby
refute_includes(list, 'xyz')
```

**Discussion**: 
- Most Minitest assertions have corresponding refutation methods that fail if the condition is true.
