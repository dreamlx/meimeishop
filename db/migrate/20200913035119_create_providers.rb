class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :title
      t.string :logo
      t.string :qrcode
      t.string :sn
      t.string :product_name
      t.string :price
      t.string :stock

      t.timestamps
    end
  end
end
