require 'rails_helper'

RSpec.describe 'Event Invitation' do
  before(:each) do
    @user = User.new(name: 'Example user', email: 'user@example.com')
    @user.save

    @event = Event.new(name: 'Event name', description: 'descriptiondescriptiondescription',
                       place: 'placesplaces', date: Date.today, creator: @user)

    @event.save

    @ei = EventInvitation.new(attendee: @user, attended_event: @event)
    @ei.save
  end


  it 'should be valid if the complete EventInvitation setup is valid' do
    expect(@ei).to be_valid 
  end

  it 'should be valid EventInvitation <=> event association check fails' do
    @ei.attended_event = nil
    expect(@ei).to_not be_valid 
  end

  it 'should be valid EventInvitation <=> user:attendee association check fails' do
    @ei.attendee = nil
    expect(@ei).to_not be_valid 
  end
end
