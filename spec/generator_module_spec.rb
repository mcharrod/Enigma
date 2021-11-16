require './spec_helper'
require './lib/generator_module'
require './lib/key'
require './lib/offset'

RSpec.describe Generator do

  it 'generates key' do
    key = Key.new

    expect(key.key.length).to eq(5)
  end

  it 'generates date' do
    offset = Offset.new

    expect(offset.date).to be_a(String)
    expect(offset.date.length).to eq(6)
  end
end
