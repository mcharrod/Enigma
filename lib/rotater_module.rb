module Rotater
  # rotater module processes the message and rotates on A, B, C, D shifts.

  # divide the message into arrays ("chunks") of 4 characters each
  def chunked(message)
    message.chars.each_slice(4).to_a
  end



  # take the unencrypted message and run it through the encryptor
  def scrambler(message)
    chunked(message.downcase).each_with_object("") do |chunk, string|
      [:a_shift, :b_shift, :c_shift, :d_shift].each_with_index do |shift, index|
        next if chunk[index].nil?

        string << forward_rotate(chunk[index], @shifts[shift])
      end
    end
  end

  # take the gibberish and translate to a language 
  def decryptor(gibberish)
    chunked(gibberish).each_with_object("") do |chunk, string|
      [:a_shift, :b_shift, :c_shift, :d_shift].each_with_index do |shift, index|
        next if chunk[index].nil?

        string << reverse_rotate(chunk[index], @shifts[shift])
      end
    end
  end

  # take each character and obscure it by that character's shift
  def forward_rotate(character, shift)
    return character unless @character_array.include?(character)

    character_index = @character_array.index(character)
    total = character_index + shift
    @character_array.rotate(total).first
  end

  # take each character and revert it back to it's original character
  def reverse_rotate(character, shift)
    return character unless @character_array.include?(character)

      character_index = @character_array.index(character)
      total = character_index - shift
      @character_array.rotate(total).first
  end

end
