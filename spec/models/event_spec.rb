require 'rails_helper'

RSpec.describe 'Event' do
  before(:each) do
    @user = User.new(name: 'Example user', email: 'user@example.com')
    @user.save

    @event = Event.new(name: 'Event name', description: 'descriptiondescriptiondescription',
                       place: 'placesplaces', date: Date.today, creator: @user)

    @event.save
  end

  it 'should be valid if the complete Event setup is valid' do
    assert @event.valid?
  end

  it 'should be valid if event:name is nil' do
    @event.name = nil
    @event.save
    expect(@event).to_not be_valid 
  end

  it 'should be valid if event:name is below min length' do
    @event.name = 'xxx'
    @event.save
    expect(@event).to_not be_valid 
  end

  it 'should be valid if event:description is nil' do
    @event.description = nil
    @event.save
    expect(@event).to_not be_valid 
  end

  it 'should be valid if event:description is below min length' do
    @event.description = 'xxx'
    @event.save
    expect(@event).to_not be_valid 
  end

  it 'should be valid if event:place is nil' do
    @event.place = nil
    @event.save
    expect(@event).to_not be_valid 
  end

  it 'should be valid if event:place is below min length' do
    @event.place = 'xxx'
    @event.save
    expect(@event).to_not be_valid 
  end

  it 'should be valid if event:date is nil' do
    @event.date = nil
    @event.save
    expect(@event).to_not be_valid 
  end
end
