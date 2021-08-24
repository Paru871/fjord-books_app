# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_relationships,  class_name: 'Relationship',
                                   foreign_key: 'follower_id',
                                   dependent: :destroy,
                                   inverse_of: :follower
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy,
                                   inverse_of: :followed
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    followings << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    # active_relationships.find_by(followed_id: other_user.id).destroy
    @active_relationships = active_relationships.find_by(followed_id: other_user.id)
    return if @active_relationships == nil
    @active_relationships.destroy
  end

  # 現在のユーザーがフォローしていたらtrueを返す
  def followings?(other_user)
    followings.include?(other_user)
  end
end
