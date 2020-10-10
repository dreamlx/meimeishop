class AddAvatarUrlToBuyer < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :avatar_url, :string
  end
end
