require 'spec_helper'
require './lib/enigma'
require './lib/encrypt'
require 'pry'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it 'can generate key' do
    enigma = Enigma.new
    enigma.generate_key

    expect(enigma.key.length).to eq(5)
  end

  it 'encrypts message' do
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end
end
