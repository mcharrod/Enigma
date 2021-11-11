require 'simplecov'

SimpleCov.start

class Enigma
  attr_reader :key
  def initialize
    @key = generate_key
  end

  def generate_key
    num = []
    5.times do
      num.push(rand(0..9))
    end
    num.join
  end

end
