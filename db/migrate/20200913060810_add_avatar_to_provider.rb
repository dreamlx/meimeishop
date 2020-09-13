class AddAvatarToProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :avatar, :string
  end
end
