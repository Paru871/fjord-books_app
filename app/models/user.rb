# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validate :image_type

  private

  def image_type
    return unless avatar.attached?

    return if avatar.blob.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))

    errors.add(:avatar, I18n.t('wrong_content_type'))
  end
end
