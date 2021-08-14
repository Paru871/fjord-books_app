# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  # validate :image_type

  def thumbnail
    avatar.variant(resize_to_fit: [100, 100]).processed
  end

  # private

  # def image_type
  #   return unless avatar.attached?

  #   return if avatar.blob.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))

  #   errors.add(:avatar, I18n.t('errors.messeges.wrong_content_type'))
  # end
end
