require 'spec_helper'
require './lib/enigma'
require './lib/encrypt'
require 'pry'

RSpec.describe Enigma do

  it 'exists' do
    key = Enigma.new

    expect(key).to be_a(Enigma)
  end

  it 'key is exactly 5 digits' do
    enigma = Enigma.new

    expect(enigma.key.length).to eq(5)
  end

  it 'can be zero padded' do
    enigma = Enigma.new

    allow(enigma).to receive(enigma.key).and_return("07529")
  end

  it 'makes A through D' do
    enigma = Enigma.new

    expect(enigma.abcd.keys.count).to eq(4)
    expect(enigma.abcd.keys).to eq([:a, :b, :c, :d])
  end

  it 'creates a date' do
    enigma = Enigma.new
    enigma.date

    expect(enigma.date).to eq(111121)
  end

  it 'retrieves last 4 digits for the dates current offset' do
    enigma = Enigma.new

    expect(enigma.offset).to eq({:a=>"6", :b=>"6", :c=>"4", :d=>"1"})
  end

  it 'assigns 4 digit offset to ABCD' do
    enigma = Enigma.new

    expect(enigma.forward_shift.keys).to eq([:a_shift, :b_shift, :c_shift, :d_shift])
  end
end
