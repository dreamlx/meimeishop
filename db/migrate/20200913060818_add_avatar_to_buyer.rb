class AddAvatarToBuyer < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :avatar, :string
  end
end
