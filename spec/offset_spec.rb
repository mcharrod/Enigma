require 'spec_helper'
require './lib/enigma'
require './lib/encrypt'
require './lib/offset'
require 'pry'

RSpec.describe Offset do

  it 'creates a date' do
    offset = Offset.new

    expect(offset.date.digits.count).to eq(6)
  end

  it 'retrieves last 4 digits for the dates current offset' do
    offset = Offset.new(111321)

    expect(offset.a_offset).to eq("5")
    expect(offset.b_offset).to eq("0")
    expect(offset.c_offset).to eq("4")
    expect(offset.d_offset).to eq("1")
  end

  # it 'assigns 4 digit offset to ABCD' do
  #   offset = Offset.new
  #
  #   expect(offset.forward_shift).to eq([:a_shift, :b_shift, :c_shift, :d_shift])
  # end

end
