require 'spec_helper'
require './lib/offset'
require 'pry'

RSpec.describe Offset do

  it 'creates a date' do
    offset = Offset.new

    expect(offset.date.length).to eq(6)
  end

  it 'retrieves last 4 digits for the dates current offset' do
    offset = Offset.new(111321)

    expect(offset.a_offset).to eq("5")
    expect(offset.b_offset).to eq("0")
    expect(offset.c_offset).to eq("4")
    expect(offset.d_offset).to eq("1")
  end

  it 'generates a key for line coverage' do
    offset = Offset.new(111421)

    expect(offset.generate_key.length).to eq(5)
  end
end
