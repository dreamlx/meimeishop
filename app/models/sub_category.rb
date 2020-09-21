class SubCategory < Category
    default_scope -> { where("parent_id is not null") }
    has_many :providers
    belongs_to :main_category, foreign_key: :parent_id
end
