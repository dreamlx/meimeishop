class RenameStockToProvider < ActiveRecord::Migration[5.2]
  def change
    rename_column :providers, :stock, :quantity
  end
end
