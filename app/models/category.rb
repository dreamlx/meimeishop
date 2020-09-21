class Category < ApplicationRecord
    #default_scope -> { where(parent_id: nil) }
    scope :all_parents, -> { where("parent_id is not null") }
    has_many :providers
end
