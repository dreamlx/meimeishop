class SubCategory < Category
    default_scope -> { where("parent_id is not null and category_type = ?","SubCategory") }
    has_many :providers
    belongs_to :main_category, foreign_key: :parent_id
    has_many :item_categories, foreign_key: :parent_id
end
