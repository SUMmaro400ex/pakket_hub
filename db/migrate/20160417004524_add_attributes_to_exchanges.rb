class AddAttributesToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :amount, :string
    add_column :exchanges, :transaction_identifier, :string
    add_column :exchanges, :surcharge, :string
  end
end
