require 'rails_helper'

RSpec.describe Shift, type: :model do
  it 'is valid with valid attributes' do
    expect(Shift.new(from: DateTime.now, to: DateTime.now + 1.hour)).to be_valid
  end

  it 'is not valid without from' do
    expect(Shift.new(from: '', to: DateTime.now + 1.hour)).to be_invalid
  end

  it 'is not valid without to' do
    expect(Shift.new(from: DateTime.now, to: '')).to be_invalid
  end
end