require 'spec_helper'
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it 'can generate date' do
    enigma = Enigma.new
    enigma.today

    expect(enigma.today.length).to eq(6)
  end

  it 'encrypts message' do
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    expect(enigma.encrypt("HeLlo world", "02715", "040895")).to eq(expected)
  end

  it 'decrypts message' do
    enigma = Enigma.new
    decrypted = {decryption: "hello world", key: "02715", date: "040895"}
    gibberish = "keder ohulw"
    # message = enigma.encrypt("hello world", "02715", "040895")

    expect(enigma.decrypt(gibberish, "02715", "040895")).to eq(decrypted)
  end
end
