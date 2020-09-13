class Provider < ApplicationRecord
    default_scope { order(created_at: :desc) }
    has_many :pictures, as: :imageable
    mount_uploader :avatar, AvatarUploader
    mount_uploader :logo, AvatarUploader
    mount_uploader :qrcode, AvatarUploader

    
end
