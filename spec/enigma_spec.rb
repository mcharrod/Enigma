
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

  it 'can be zero padded' do
    num = Enigma.new

    allow(num).to receive(num.key).and_return("07529")
  end

  it 'makes A through D' do
    num = Enigma.new

    expect(num.abcd.keys.count).to eq(4)
    expect(num.abcd.keys).to eq([:a, :b, :c, :d])
  end

  it 'creates a date' do
    num = Enigma.new
    num.date

    expect(num.date).to eq(111121)
  end

  it 'retrieves last 4 digits for the dates current offset' do
    num = Enigma.new

    expect(num.offset).to eq({:a=>"6", :b=>"6", :c=>"4", :d=>"1"})
  end

  it 'assigns 4 digit offset to ABCD' do
    num = Enigma.new

    expect(num.forward_shift.keys).to eq([:a_shift, :b_shift, :c_shift, :d_shift])
  end

end
