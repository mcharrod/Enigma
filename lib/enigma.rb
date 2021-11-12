require 'simplecov'
SimpleCov.start
require 'date'

class Enigma
  attr_reader :key,
              :abcd,
              :date
  def initialize
    @key  = generate_key
    @abcd = shift_by
    @date = today
  end

  def generate_key
    num = []
    5.times do
      num.push(rand(0..9))
    end
    num.join
  end

  def shift_by
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

  def offset
    four = []
    squared = (date * date).to_s
    four.append(squared[-4])
    four.append(squared[-3])
    four.append(squared[-2])
    four.append(squared[-1])
    four.join.to_i
  end


end
