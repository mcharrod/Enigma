require 'date'
require 'pry'
require_relative 'key'
require_relative 'offset'

class Enigma
  include Generator

  attr_reader :key,
              :offset,
              :chars

  def initialize
    @key        = nil
    @offset     = nil
    @shifts     = {}
    @chars      = ("a".."z").to_a << " "
    @return_hash = {}
  end

  def chunks(message)
    message.chars.each_slice(4).to_a
  end

  def scramble(message)
    encrypted = []
      chunks(message).each do |chunk|
        encrypted.push(rotation(chunk[0], @shifts[:a_shift]))
          encrypted.push(rotation(chunk[1], @shifts[:b_shift]))
            encrypted.push(rotation(chunk[2], @shifts[:c_shift]))
              encrypted.push(rotation(chunk[3], @shifts[:d_shift]))
      end
    @return_hash[:encryption] = encrypted.compact.flatten.join
  end

  def rotation(character, the_shift)
    if character != nil
      character_ranking = @chars.index(character)
      total = character_ranking + the_shift
      @chars.rotate(total).first
    end
  end

  def encrypt(message, key = generate_key, date = today)
    if key.length == 6
      date = key
    elsif key.length != 5 && key.length != 6
      puts "invalid input." # prompt to try again
    end
    @key = Key.new(key)
    @offset = Offset.new(date)
    total_shift
    chunks(message)
    scramble(message)
    @return_hash[:key] = key
    @return_hash[:date] = date
    @return_hash
  end

  def total_shift
     @shifts[:a_shift] = (@key.a_key.to_i + @offset.a_offset.to_i)
     @shifts[:b_shift] = (@key.b_key.to_i + @offset.b_offset.to_i)
     @shifts[:c_shift] = (@key.c_key.to_i + @offset.c_offset.to_i)
     @shifts[:d_shift] = (@key.d_key.to_i + @offset.d_offset.to_i)
     @shifts
     # idea for refactor:
     # @shifts [[key]_shift] = (@key.[key]_key + @offset.[offset]_offset)??
  end

end
