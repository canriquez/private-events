require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example user', email: 'user@example.com')
    @user.save
  end

  test 'HERE should be valid' do
    assert @user.valid?
  end

=begin   test 'title should be the right length' do
    @post.title = 'a' * 300
    assert_not @post.valid?
  end

  test 'body should be the right length' do
    @post.body = 'aa'
    assert_not @post.valid?
  end 
=end

end
