class Buyer < ApplicationRecord
    default_scope { order(created_at: :desc) }
    has_many :pictures, as: :imageable
    mount_uploader :avatar, AvatarUploader
end
