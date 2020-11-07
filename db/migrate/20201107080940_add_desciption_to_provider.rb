class AddDesciptionToProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :description, :text
  end
end
