class CreateWxUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :wx_users do |t|
      t.integer :user_id
      t.string  :openid

      t.timestamps
    end
  end
end
