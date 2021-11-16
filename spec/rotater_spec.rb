require 'spec_helper'
require './lib/enigma'
require './lib/rotater_module'

RSpec.describe Rotater do
  it 'encrypts message' do
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    expect(enigma.encrypt("HeLlo world", "02715", "040895")).to eq(expected)
  end

  it 'decrypts message' do
    enigma = Enigma.new
    decrypted = {decryption: "hello world", key: "02715", date: "040895"}
    gibberish = "keder ohulw"

    expect(enigma.decrypt(gibberish, "02715", "040895")).to eq(decrypted)
  end

  it 'can decrypt with special characters' do
    enigma = Enigma.new
    message = "!!! what up"
    enigma.encrypt(message, 12345, 101020)
    beginning = enigma.decrypt(message, 12345, 101020).values.last.start_with?("!!")

    expect(beginning).to eq(true)
  end

  it 'can encrypt/decrypt with no date' do
    enigma = Enigma.new
    message = "Hey friends hows it going the weather is clear sunny skies"
    result = enigma.encrypt(message)
    key = result[:key]
    gibberish = result[:encryption]

    expect(enigma.decrypt(gibberish, key)[:decryption]).to eq(message.downcase)
  end
end
