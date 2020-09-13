class AddTitleToBuyer < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :title, :string
  end
end
