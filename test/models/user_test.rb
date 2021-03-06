require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example user', email: 'user@example.com')
    @user.save
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should be not valid when :name above max size 50 characters' do
    @user.name = 'names' * 20
    @user.save
    assert_not @user.valid?
  end

  test 'should be not valid when :name is nil' do
    @user.name = nil
    @user.save
    assert_not @user.valid?
  end

  test 'should be not valid when :email is not format compliant' do
    @user.email = 'aba@'
    @user.save
    assert_not @user.valid?
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'should be not valid when :email is nil' do
    @user.email = nil
    @user.save
    assert_not @user.valid?
  end
end
