require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @known_hash = {
      'uid' => 1,
      'info' => {'name' => 'Michael',
                 'nickname' => 'mybuddymichael',
                 'email'=> nil},
      'credentials' => {'token' => 1111}
    }

    @unknown_hash = {
      'uid' => 2,
      'info' => {'name' => 'foo',
                 'nickname' => 'foobar',
                 'email'=> nil},
      'credentials' => {'token' => 2222}
    }
  end

  test 'can find user by omniauth hash' do
    user = User.find_or_create_with_omniauth(@known_hash)
    assert(user)
  end

  test 'an unknown omniauth hash creates a resource' do
    user = User.find_or_create_with_omniauth(@unknown_hash)
    assert_equal(2, user.gh_uid)
  end

  test 'should update a resource with a new token' do
    @known_hash['credentials']['token'] = 9999
    user = User.find_or_create_with_omniauth(@known_hash)
    assert_equal(9999, user.token)
  end

end
