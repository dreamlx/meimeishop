class RenameCategoryToMainCategoryInProvider < ActiveRecord::Migration[5.2]
  def change
    rename_column :providers, :category_id, :main_category_id
  end
end
