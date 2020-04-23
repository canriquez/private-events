require 'rails_helper'

RSpec.describe 'User' do
  before(:each) do
    @user = User.new(name: 'Example user', email: 'user@example.com')
    @user.save
  end

  it 'should be valid' do
    assert @user.valid?
  end

  it 'should be not valid when :name above max size 50 characters' do
    @user.name = 'names' * 20
    @user.save
    expect(@user).to_not be_valid
  end

  it 'should be not valid when :name is nil' do
    @user.name = nil
    @user.save
    expect(@user).to_not be_valid
  end

  it 'should be not valid when :email is not format compliant' do
    @user.email = 'aba@'
    @user.save
    expect(@user).to_not be_valid
  end

  it 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).to_not be_valid
  end

  it 'should be not valid when :email is nil' do
    @user.email = nil
    @user.save
    expect(@user).to_not be_valid
  end
end
