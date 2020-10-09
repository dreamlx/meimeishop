class ItemCategory < Category
  default_scope -> { where("parent_id is not null and category_type = ?","ItemCategory") }
  has_many :providers
  belongs_to :sub_category, foreign_key: :parent_id

end
