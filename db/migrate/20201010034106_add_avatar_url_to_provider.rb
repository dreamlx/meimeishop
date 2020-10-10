class AddAvatarUrlToProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :avatar_url, :string
  end
end
