class RemoveLogoInPorvider < ActiveRecord::Migration[5.2]
  def change
    remove_column :providers, :logo
  end
end
