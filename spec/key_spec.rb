require 'spec_helper'
require './lib/key'
require 'pry'

RSpec.describe Key do

  it 'exists' do
    key = Key.new

    expect(key).to be_a(Key)
  end

  it 'key is exactly 5 digits' do
    key_object = Key.new

    expect(key_object.key.length).to eq(5)
  end

  it 'can be zero padded' do
    key_object = Key.new("07529")

    expect(key_object.key).to eq("07529")
  end

  it 'makes A through D' do
    key_object = Key.new("12345")

    expect(key_object.a_key).to eq("12")
    expect(key_object.b_key).to eq("23")
    expect(key_object.c_key).to eq("34")
    expect(key_object.d_key).to eq("45")
  end

  it 'makes a date for line coverage' do
    key = Key.new
    key.today
    expect(key.today.length).to eq(6)
  end
  
end
