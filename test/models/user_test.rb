# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Alice'
    assert_equal 'Alice', user.name_or_email
  end

  test '#follow' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.active_relationships.where(following_id: bob.id).exists?
    assert_not bob.passive_relationships.where(follower_id: alice.id).exists?

    alice.follow(bob)

    assert alice.active_relationships.where(following_id: bob.id).exists?
    assert bob.passive_relationships.where(follower_id: alice.id).exists?
  end

  test '#unfollow' do
    alice = users(:alice)
    bob = users(:bob)

    alice.follow(bob)
    alice.unfollow(bob)

    assert_not alice.active_relationships.where(following_id: bob.id).exists?
    assert_not bob.passive_relationships.where(follower_id: alice.id).exists?
  end

  test '#following?' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)

    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not bob.followed_by?(alice)

    alice.follow(bob)
    assert bob.followed_by?(alice)
  end
end
