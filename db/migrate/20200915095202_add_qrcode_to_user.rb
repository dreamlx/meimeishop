class AddQrcodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :qrcode, :string
    add_column :users, :contact, :string
  end
end
