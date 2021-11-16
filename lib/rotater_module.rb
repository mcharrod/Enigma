module Rotater
  # rotater module processes the message and rotates on A, B, C, D shifts. 

  # divide the message into arrays ("chunks") of 4 characters each
  def chunked(message)
    message.chars.each_slice(4).to_a
  end

  # take the unencrypted message and run it through the encryptor
  def scrambler(message)
    encrypted = []
      chunked(message.downcase).each do |chunk|
        encrypted.push(forward_rotate(chunk[0], @shifts[:a_shift]))
        encrypted.push(forward_rotate(chunk[1], @shifts[:b_shift]))
        encrypted.push(forward_rotate(chunk[2], @shifts[:c_shift]))
        encrypted.push(forward_rotate(chunk[3], @shifts[:d_shift]))
      end
    encrypted.compact.flatten.join
  end

  # take the encrypted message and run it through the decryptor
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

  # take each character and obscure it by that character's shift
  def forward_rotate(character, shift)
    if character != nil
      if @character_array.include?(character) == false
        character
      else
        character_ranking = @character_array.index(character)
        total = character_ranking + shift
        @character_array.rotate(total).first
      end
    end
  end

  # take each character and revert it back to it's original character
  def reverse_rotate(character, shift)
    if character != nil
      if @character_array.include?(character) == false
        character
      else
        char_index = @character_array.index(character)
        total = char_index - shift
        @character_array.rotate(total).first
      end
    end
  end

end
