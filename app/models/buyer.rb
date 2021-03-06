class Buyer < ApplicationRecord
    default_scope { order(created_at: :desc) }
    
    has_many :pictures, as: :imageable
    belongs_to :user

    mount_uploader :avatar, AvatarUploader

    validates :title, presence: true
    validates :quantity, numericality: { only_integer: true }
end
