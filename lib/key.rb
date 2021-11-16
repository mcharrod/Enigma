require_relative 'generator_module'
require 'pry'

class Key
  include Generator
  # Key class keeps track of key offsets for A, B, C, D
  attr_reader :key,
              :a_key,
              :b_key,
              :c_key,
              :d_key

  def initialize(key_arg = generate_key)
    @key   = key_arg
    @a_key = key[0..1]
    @b_key = key[1..2]
    @c_key = key[2..3]
    @d_key = key[3..4]
  end

end
