require 'date'
require 'pry'
require_relative 'generator_module'

class Offset
  include Generator
  attr_reader :date,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset

  def initialize(date = today)
    @date     = date
    @a_offset = squared[-4]
    @b_offset = squared[-3]
    @c_offset = squared[-2]
    @d_offset = squared[-1]
  end

  def num
    date.to_i
  end

# convert a string date into an integer then square it
  def squared
    (num * num).to_s
  end


end
