class AddItemToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :item, :string
    add_column :requests, :item_url, :string
  end
end
