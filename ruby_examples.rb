
## Instance variables, classes, objects, metaprogramming
class Student
  def initialize(fname, lname, id)
    @fname = fname
    @lname = lname
    @id = id
  end

  def full_name
    @lname + ', ' + @fname
  end

  attr_accessor :lname
  attr_reader :id
  attr_writer :fname
end

# we could use `student_info = gets.chomp` to get input
student_info = 'Xu, Vic'
fname, lname = student_info.split(',').map { |name| name.strip }
new_student = Student.new(fname, lname, (rand * 1000000).round)


## How to use lambdas/procs
# Creating/calling lambdas
upper = ->(str) { str.strip.upcase }
upper.call(' hello ')

# Lambdas can be used to store behavior for future lookup
strategies = { 'upper' => ->(str) { str.upcase },
               'scramble' => ->(str) { str.chars.sample(str.length).join } }

# Imagine we get user input for a string (str) and and action to do
str = 'hello!'
action = 'scramble'

# Now, instead of procedural if/else...
if action == 'upper'
  str.strip.upcase
elsif action == 'scramble'
  str.chars.sample(str.length).join
end  # => "e!hllo"

# ... we can make a single functional call to handle either case
strategies[action].call(str)  # => "lheol!"


## Dangerous methods
greeting = 'hello there'  # => "hello there"
greeting.reverse          # => "ereht olleh"
greeting                  # => "hello there"

greeting.reverse!         # => "ereht olleh"
greeting                  # => "ereht olleh"

## Blocks
def open_db
  puts 'OPENING'
end

def close_db
  puts 'CLOSING'
end

def read_db
  puts 'READING'
  rand
end

def write_db(data)
  puts data
end

# Instead of always remembering to open/close the database like this:
open_db
x = read_db
y = read_db
z = x + y
write_db(z)
close_db

# We can use this method that accepts a block and opens/closes for us
def with_database
  open_db
  result = yield
  close_db
  result
end

with_database { read_db }
