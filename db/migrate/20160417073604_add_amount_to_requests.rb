class AddAmountToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :amount, :string
  end
end
