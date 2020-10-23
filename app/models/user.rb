class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :phone

  mount_uploader :qrcode, AvatarUploader

  has_many :buyers
  has_many :providers
  after_destroy :delete_user_id

  def email_required?
    false
  end

  def delete_user_id
    @wx_user = WxUser.find_by(user_id: self.id)
    if @wx_user.present?
      @wx_user.update!(user_id: nil)
    end
  end


end
