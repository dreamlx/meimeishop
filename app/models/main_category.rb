class MainCategory < Category
    default_scope -> { where(parent_id: nil) }
    has_many :providers
    has_many :sub_categories, foreign_key: :parent_id
end
