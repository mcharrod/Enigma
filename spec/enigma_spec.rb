
require 'spec_helper'
require './lib/enigma'
require 'pry'



RSpec.describe Enigma do

  it 'exists' do
    key = Enigma.new

    expect(key).to be_a(Enigma)
  end

end 
