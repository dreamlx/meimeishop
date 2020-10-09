class AddItemCategoryToProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :item_category_id, :integer
  end
end
