require 'test_helper'

class EventInvitationTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example user', email: 'user@example.com')
    @user.save

    @event = Event.new(name: 'Event name', description: 'descriptiondescriptiondescription',
                       place: 'placesplaces', date: Date.today, creator: @user)

    @event.save

    @ei = EventInvitation.new(attendee: @user, attended_event: @event)
    @ei.save
  end

  test 'should be valid if the complete EventInvitation setup is valid' do
    assert @ei.valid?
  end

  test 'should be valid EventInvitation <=> event association check fails' do
    @ei.attended_event = nil
    assert_not @ei.valid?
  end

  test 'should be valid EventInvitation <=> user:attendee association check fails' do
    @ei.attendee = nil
    assert_not @ei.valid?
  end
end
