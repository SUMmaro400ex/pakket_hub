class AddCardAttributesToCreditCards < ActiveRecord::Migration
  def change
    add_column :credit_cards, :first_name, :string
    add_column :credit_cards, :last_name, :string
    add_column :credit_cards, :number, :string
    add_column :credit_cards, :address_line_1, :string
    add_column :credit_cards, :address_line_2, :string
    add_column :credit_cards, :city, :string
    add_column :credit_cards, :country, :string
    add_column :credit_cards, :zipcode, :string
    add_column :credit_cards, :state, :string
    add_column :credit_cards, :expiration_month, :string
    add_column :credit_cards, :expiration_year, :string
    add_column :credit_cards, :cvv, :string
  end
end
