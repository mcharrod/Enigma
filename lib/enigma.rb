require 'simplecov'
SimpleCov.start
require 'date'

class Enigma
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

  def generate_key
    num = []
    5.times do
      num.push(rand(0..9))
    end
    num.join
  end

  def key_letters
    key_letters = {}
    a = key[0..1]
    b = key[1..2]
    c = key[2..3]
    d = key[3..4]
    key_letters[:a] = a
    key_letters[:b] = b
    key_letters[:c] = c
    key_letters[:d] = d
    key_letters
  end

  def today
    array = []
    current_date = Date.today
    array << current_date.month
    array << current_date.day
    array << current_date.year.to_s[2..3]
    @date = array.join.to_i
  end

  def the_offset
    offsets = {}
    squared = (date * date).to_s
    a_offset = squared[-4]
    b_offset = squared[-3]
    c_offset = squared[-2]
    d_offset = squared[-1]
    offsets[:a] = a_offset
    offsets[:b] = b_offset
    offsets[:c] = c_offset
    offsets[:d] = d_offset
    offsets
  end

  def forward_shift
    the_shift = {}
    the_shift[:a_shift] = the_offset[:a].to_i + key_letters[:a].to_i
    the_shift[:b_shift] = the_offset[:b].to_i + key_letters[:b].to_i
    the_shift[:c_shift] = the_offset[:c].to_i + key_letters[:c].to_i
    the_shift[:d_shift] = the_offset[:d].to_i + key_letters[:d].to_i
    the_shift
  end



  # def offset
  #   four = []
  #   squared = (date * date).to_s
  #   four.append(squared[-4])
  #   four.append(squared[-3])
  #   four.append(squared[-2])
  #   four.append(squared[-1])
  #   four.join.to_i
  # end

  # a shift is the a key plus the a offset
  # b shift is the b key plus the b offset


end
