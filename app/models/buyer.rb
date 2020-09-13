class Buyer < ApplicationRecord
    has_many :pictures, as: :imageable
    mount_uploader :avatar, AvatarUploader
end
