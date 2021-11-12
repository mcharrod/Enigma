class Key
  attr_reader :key

  def initialize(key_arg = generate_key)
    @key = key_arg
  end

  def generate_key
    num = []
    5.times do
      num.push(rand(0..9))
    end
    @key = num.join
  end

  def a_key
    a = key[0..1]
  end

  def b_key
    b = key[1..2]
  end

  def c_key
    c = key[2..3]
  end

  def d_key
    d = key[3..4]
  end
end
