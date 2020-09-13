class RenameProductNameToProvider < ActiveRecord::Migration[5.2]
  def change
    rename_column :providers, :product_name, :product
  end
end
