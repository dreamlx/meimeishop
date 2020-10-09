class Provider < ApplicationRecord
    default_scope { order(created_at: :desc) }
    
    has_many :pictures, as: :imageable
    belongs_to :user
    belongs_to :sub_category
    belongs_to :main_category
    belongs_to :item_category


    validates :title, presence: true
    validates :price, numericality: true
    validates :quantity, numericality: { only_integer: true }


    mount_uploader :avatar, AvatarUploader
    

    
end
