# OOP
module Scrambler
  def scramble
    json_output = to_json
    json_output.chars.sample(json_output.length).join
  end
end

class Student
  include Scrambler
  def initialize(fname, lname, id)
    # initialize "instance variables"
    @fname = fname
    @lname = lname
    @id = id
  end

  attr_reader :id
  attr_accessor :fname, :lname

  def full_name
    @lname + ', ' + @fname
  end

  def to_json(*options)
    {
      id: @id,
      full_name: full_name
    }.to_json(*options)
  end
end

class ClassRoom
  include Scrambler
  # ...
  # def to_json
end

st = Student.new('Orison', 'Flores', 9234)

# LAMBDAS (anonymous functions)

weird = ->(str) { str.reverse.upcase }
