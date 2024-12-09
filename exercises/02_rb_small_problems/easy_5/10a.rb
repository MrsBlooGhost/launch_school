# P-----------

# E-----------

# D-----------

# A-----------

# C-----------

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me("hello world") # "olleh dlrow"