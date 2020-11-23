class AddMarketPriceToProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :market_price, :decimal
  end
end
