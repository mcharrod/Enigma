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
    @chars      = ("a".."z").to_a.push(" ")
    @return_gibberish = {}
    @return_message = {}
  end

  def chunked(message)
    message.chars.each_slice(4).to_a
  end

  def scrambler(message)
    encrypted = []
      chunked(message.downcase).each do |chunk|
        encrypted.push(forward_rotate(chunk[0], @shifts[:a_shift]))
          encrypted.push(forward_rotate(chunk[1], @shifts[:b_shift]))#bad
            encrypted.push(forward_rotate(chunk[2], @shifts[:c_shift]))
              encrypted.push(forward_rotate(chunk[3], @shifts[:d_shift]))
      end
    @return_gibberish[:encryption] = encrypted.compact.flatten.join
  end

  def decryptor(gibberish)
    decrypted = []
      chunked(gibberish).each do |chunk|
        decrypted.push(reverse_rotate(chunk[0], @shifts[:a_shift]))
          decrypted.push(reverse_rotate(chunk[1], @shifts[:b_shift]))
            decrypted.push(reverse_rotate(chunk[2], @shifts[:c_shift]))
              decrypted.push(reverse_rotate(chunk[3], @shifts[:d_shift]))
      end
    decrypted.join
  end

  def forward_rotate(character, the_shift)
    if character != nil
      if  @chars.include?(character) == false
        character
      else
        character_ranking = @chars.index(character)
        total = character_ranking + the_shift
        @chars.rotate(total).first
      end
    end
  end

  def reverse_rotate(character, shift)
    if character != nil
      if @chars.include?(character) == false
        character
      else
        char_index = @chars.index(character)
          total = char_index - shift
        @chars.rotate(total).first
      end
    end
  end

  def encrypt(message, key = generate_key, date = today)
    @key = Key.new(key)
    @offset = Offset.new(date)
    @return_gibberish[:key] = key
    @return_gibberish[:date] = date
    total_shift
    scrambler(message)
    @return_gibberish
  end

  def decrypt(message, key, date)
    @key = Key.new(key)
    @offset = Offset.new(date)
     total_shift
    gibberish = message
    @return_message[:key] = key
    @return_message[:date] = date
    # decrypted_message = message
    # gibberish = decrypted_message.delete(:encryption)
    # decrypted_message[:decryption] =
    @return_message[:decryption] = decryptor(gibberish)
    @return_message
    # decrypted_message
  end

  def total_shift
     @shifts[:a_shift] = (@key.a_key.to_i + @offset.a_offset.to_i)
     @shifts[:b_shift] = (@key.b_key.to_i + @offset.b_offset.to_i)
     @shifts[:c_shift] = (@key.c_key.to_i + @offset.c_offset.to_i)
     @shifts[:d_shift] = (@key.d_key.to_i + @offset.d_offset.to_i)
     @shifts
  end

end
