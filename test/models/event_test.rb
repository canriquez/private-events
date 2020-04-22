require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example user', email: 'user@example.com')
    @user.save

    @event = Event.new(name: 'Event name', description: 'descriptiondescriptiondescription',
                       place: 'placesplaces', date: Date.today, creator: @user)

    @event.save
  end

  # User model test
  test 'should be valid if the complete Event setup is valid' do
    # p @event.errors.full_messages
    assert @event.valid?
  end

  test 'should be valid if event:name is nil' do
    @event.name = nil
    @event.save
    assert_not @event.valid?
  end

  test 'should be valid if event:name is below min length' do
    @event.name = 'xxx'
    @event.save
    assert_not @event.valid?
  end

  test 'should be valid if event:description is nil' do
    @event.description = nil
    @event.save
    assert_not @event.valid?
  end

  test 'should be valid if event:description is below min length' do
    @event.description = 'xxx'
    @event.save
    assert_not @event.valid?
  end

  test 'should be valid if event:place is nil' do
    @event.place = nil
    @event.save
    assert_not @event.valid?
  end

  test 'should be valid if event:place is below min length' do
    @event.place = 'xxx'
    @event.save
    assert_not @event.valid?
  end

  test 'should be valid if event:date is nil' do
    @event.date = nil
    @event.save
    assert_not @event.valid?
  end
end
