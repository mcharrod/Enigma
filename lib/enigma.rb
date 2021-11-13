require 'simplecov'
SimpleCov.start
require 'date'
require 'pry'
require_relative 'key'

class Enigma

  attr_reader :default_key

  def initialize
    @default_key = Key.new
  end

  def encrypt(message, key = default_key, date = today)
    binding.pry
  end

  #
  # def generate_key
  #   num = []
  #   5.times do
  #     num.push(rand(0..9))
  #   end
  #   @key = num.join
  # end
  #
  # def key_letters
  #   key_letters = {}
  #   a = key[0..1]
  #   b = key[1..2]
  #   c = key[2..3]
  #   d = key[3..4]
  #   key_letters[:a] = a
  #   key_letters[:b] = b
  #   key_letters[:c] = c
  #   key_letters[:d] = d
  #   key_letters
  # end


  def forward_shift
    the_shift = {}
    the_shift[:a_shift] = the_offset[:a].to_i + key_letters[:a].to_i
    the_shift[:b_shift] = the_offset[:b].to_i + key_letters[:b].to_i
    the_shift[:c_shift] = the_offset[:c].to_i + key_letters[:c].to_i
    the_shift[:d_shift] = the_offset[:d].to_i + key_letters[:d].to_i
    the_shift
  end
end
