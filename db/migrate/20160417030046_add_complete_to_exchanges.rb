class AddCompleteToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :complete, :boolean
  end
end
