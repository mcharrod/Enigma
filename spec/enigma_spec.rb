
require 'spec_helper'
require './lib/enigma'
require 'pry'



RSpec.describe Enigma do

  it 'exists' do
    key = Enigma.new

    expect(key).to be_a(Enigma)
  end

  it 'key is exactly 5 digits' do
    num = Enigma.new

    expect(num.key.length).to eq(5)
  end

end 
