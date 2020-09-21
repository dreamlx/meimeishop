class AddCategoryToProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :category_id, :integer
    add_column :providers, :sub_category_id, :integer
  end
end
