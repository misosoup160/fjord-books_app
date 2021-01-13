# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }
  validate :image_type

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def image_type
    return unless image.attached?
    if !image.blob.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))
      errors.add(:image, 'はjpegまたはpngまたはgif形式でアップロードしてください')
    end
  end
end
