class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :phone

  mount_uploader :qrcode, AvatarUploader

  has_many :buyers
  has_many :providers

  def email_required?
    false
  end
end
