class DropQrcodeToProvider < ActiveRecord::Migration[5.2]
  def change
    remove_column :providers, :qrcode
    remove_column :buyers, :contact

    add_column :providers, :user_id, :integer
    add_column :buyers, :user_id, :integer
  end
end
