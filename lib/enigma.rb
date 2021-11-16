require 'date'
require 'pry'
require_relative 'key'
require_relative 'offset'
require_relative 'rotater_module'

class Enigma
  include Generator
  include Rotater

  # Enigma class encrypts and decrypts messages 
  attr_reader :key,
              :offset,
              :character_array

  def initialize
    @key        = nil
    @offset     = nil
    @shifts     = {}
    @character_array      = ("a".."z").to_a.push(" ")
    @return_gibberish = {}
    @return_message = {}
  end

  # take the message and run it through an encryptor
  def encrypt(message, key = generate_key, date = today)
    @key = Key.new(key)
    @offset = Offset.new(date)
    total_shift
    @return_gibberish[:key] = key
    @return_gibberish[:date] = date
    @return_gibberish[:encryption] = scrambler(message)
    @return_gibberish
  end

  # take the encrypted message and run it through a decryptor
  def decrypt(message, key = @return_gibberish[:key], date = @return_gibberish[:date])
    @key = Key.new(key)
    @offset = Offset.new(date)
    total_shift
    gibberish = message
    @return_message[:key] = key
    @return_message[:date] = date
    @return_message[:decryption] = decryptor(gibberish)
    @return_message
  end

end
