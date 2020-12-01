require 'rails_helper'

RSpec.describe Job, :type => :model do
  before(:each) do
    @language = create(:language)
    @shift = create(:shift)
  end

  it 'is valid with valid attributes' do
    expect(Job.new(title: 'any', salary_per_hour: 5, languages: [@language], shifts: [@shift])).to be_valid
  end

  it 'is not valid without a title' do
    expect(Job.new(title: '', salary_per_hour: 5, languages: [@language], shifts: [@shift])).to be_invalid
  end

  it 'is not valid without uniq title' do
    job = create(:job)
    expect(Job.new(title: job.title, salary_per_hour: 5, languages: [@language], shifts: [@shift])).to be_invalid
  end

  it 'is not valid without salary per hour' do
    expect(Job.new(title: 'any', salary_per_hour: '', languages: [@language], shifts: [@shift])).to be_invalid
  end

  it 'is not valid without languages' do
    expect(Job.new(title: 'any', salary_per_hour: 5, languages: [], shifts: [@shift])).to be_invalid
  end

  it 'is not valid without shifts' do
    expect(Job.new(title: 'any', salary_per_hour: 5, languages: [@language], shifts: [])).to be_invalid
  end

  it 'is not valid with more than 7 shifts' do
    shifts = [@shift]
    (1..7).each { |num| shifts << create(:shift, to: DateTime.now + num.hours) }
    expect(Job.new(title: 'any', salary_per_hour: 5, languages: [@language], shifts: shifts)).to be_invalid
  end

  it 'is not valid with 7 shifts' do
    shifts = []
    (1..7).each { |num| shifts << create(:shift, to: DateTime.now + num.hours) }
    expect(Job.new(title: 'any', salary_per_hour: 5, languages: [@language], shifts: shifts)).to be_valid
  end

  it 'is valid for user to apply' do
    job = create(:job)
    user = create(:user, :member)
    job.users << user
    expect(job).to be_valid
  end

  it 'is not valid for user to apply more than 1' do
    job = create(:job)
    user = create(:user, :member)
    expect { job.users += [user, user] }.to raise_error(ActiveRecord::RecordInvalid)
  end
end