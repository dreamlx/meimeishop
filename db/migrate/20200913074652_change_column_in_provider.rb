class ChangeColumnInProvider < ActiveRecord::Migration[5.2]
  def change
    change_column :providers, :price, 'numeric USING CAST(price AS numeric)'
    change_column :providers, :quantity, 'integer USING CAST(quantity AS integer)'
    change_column :buyers, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end
