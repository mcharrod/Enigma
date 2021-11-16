require 'date'
require 'pry'
require_relative 'generator_module'

class Offset
  include Generator
  # Offset class keeps track of offsets for A, B, C, D
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
end
