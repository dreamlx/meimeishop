class ChangeColumnInProvider < ActiveRecord::Migration[5.2]
  def change
    change_column :providers, :price, :decimal
    change_column :providers, :quantity, :integer
    change_column :buyers, :quantity, :integer
  end
end
