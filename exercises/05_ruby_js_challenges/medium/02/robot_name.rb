=begin
--- P
Task: Write a program that manages robot factory settings.

Rules
- Names must be random. 
- Each name must be unique.
- Different robots have different names.
- After factory reset, robot may not be assigned the same name it previously had. Name will be new and random.
- When robots come off the factory floor, they have no name. 
- The first time you boot them up, a random name is generated.
--- E

--- D
Strings
--- A-Broad
Class `Robot`
- Keep track of all robot names.

Constuctor
- Initialize a `@name` state.
- Initialize a `@history` state.

Instance method `name`
- If robot doesn't have a name (new robot or after reset):
  - Generate robot's name.
  - Check if generated name is already in list of taken names. Also check if generated name is in same robot's name history.
    - If so, generate a new one.
    - If not, save it in `@name`.
  - Append `@name` to `@@names` and to `@history`.
- Return robot's name.

Instance method `reset`
- Erases robot's name

Helper method `generate_name`
- Name must be a random string consisting of two uppercase alphabetical chars and three digits
- Keep track of names that the particular robot has had. Newly generated name after factory reset may not be the same as any of its previous ones.

--- A-Detailed
Class `Robot`
- Initialize class variable `@@names` to empty array.

Constuctor
- Initialize `@name` instance variable to nil.
- Initialize `@name_history` to empty array.

Instance method `name`
- If `@name` is nil,
  - Generate robot's name.
  - If generated name is included in `@@names` or if it's included in `@history`, generate a new one.
    - If not, save it in `@name`.
  - Append `@name` to `@@names` and to `@history`.
- Return robot's name.

Instance method `reset`
- Append `@name` to `@name_history`.
- Remove name from `@@names`.
- Re-assign `@name` to nil.

Helper method `generate_name`
- Name must be a random string consisting of two uppercase alphabetical chars and three digits
=end

class Robot
  @@names = []

  def initialize
    @name = nil
    @history = []
  end

  def name
    unless @name
      loop do
        @name = generate_name
        break unless @@names.include?(@name) || @history.include?(@name)
      end
      @@names << @name
      @history << @name
    end

    @name
  end

  def reset
    @history << @name
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    (('A'..'Z').to_a.sample(2) + (0..9).to_a.sample(3)).join
  end
end
