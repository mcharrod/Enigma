require 'simplecov'
SimpleCov.start
require 'date'
require_relative 'values_module'

class Enigma
  include ValuesModule

  attr_reader :key,
              :abcd,
              :date,
              :offset

  def initialize
    @key    = generate_key
    @abcd   = key_letters
    @date   = today
    @offset = the_offset
  end





end
