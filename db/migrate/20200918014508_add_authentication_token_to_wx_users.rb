class AddAuthenticationTokenToWxUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :wx_users, :authentication_token, :string, limit: 30
    add_index :wx_users, :authentication_token, unique: true
  end
end
