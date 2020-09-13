class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :sn
      t.string :product
      t.string :quantity
      t.string :contact
      t.string :description

      t.timestamps
    end
  end
end
