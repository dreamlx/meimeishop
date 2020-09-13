class Provider < ApplicationRecord
    default_scope { order(created_at: :desc) }
    has_many :pictures, as: :imageable

    validates :title, presence: true
    validates :price, numericality: true
    validates :quantity, numericality: { only_integer: true }


    mount_uploader :avatar, AvatarUploader
    mount_uploader :logo, AvatarUploader
    mount_uploader :qrcode, AvatarUploader

    
end
