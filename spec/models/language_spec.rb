require 'rails_helper'

RSpec.describe Language, type: :model do
  it 'is valid with valid attributes' do
    expect(Language.new(name: 'Spanish')).to be_valid
  end

  it 'is not valid without a name' do
    expect(Language.new(name: '')).to be_invalid
  end
end