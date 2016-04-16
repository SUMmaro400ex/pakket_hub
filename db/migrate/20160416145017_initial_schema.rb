class InitialSchema < ActiveRecord::Migration
  def up

    create_table :contacts do |t|
      t.string :name, null: false
      t.string :surname, null: false
    end

    add_index :contacts, [:surname, :name]

    create_table :contact_phone_numbers do |t|
      t.string :type, null: false, limit: 64
      t.string :contact_id, null: false
      t.string :phone_number_id, null: false
      t.string :status, null: false, limit: 32
    end

    add_index :contact_phone_numbers, :phone_number_id
    add_index :contact_phone_numbers, :contact_id

    create_table :phone_numbers do |t|
      t.string :country_code
      t.string :area_code, limit: 3
      t.string :subscriber_number, null: false
    end

    add_index :phone_numbers, [:area_code, :subscriber_number, :country_code], unique: true, name: :main_idx

    create_table :packages do |t|
      t.integer :exchange_id, null: false
      t.integer :request_id, null: false
      t.string :status, null: false, limit: 32
    end

    add_index :packages, :exchange_id
    add_index :packages, :request_id
    
    create_table :exchanges do |t|
      t.integer :beneficiary_id, null: false
      t.integer :courier_id, null: false
      t.integer :request_id, null: false
      t.string :status, null: false, limit: 32
    end

    add_index :exchanges, :beneficiary_id
    add_index :exchanges, :courier_id
    add_index :exchanges, :request_id

    create_table :exchange_locations do |t|
      t.integer :exchange_id, null: false
      t.integer :location_id, null: false
      t.string :status, null: false, limit: 32
    end

    add_index :exchange_locations, :exchange_id
    add_index :exchange_locations, :location_id
    
    create_table :locations do |t|
      t.string :city, limit: 64, null: false
      t.string :country, limit: 2, null: false
      t.string :state_code, limit: 2
      t.integer :zip_5
      t.integer :zip_4
      t.integer :latitude
      t.integer :longitude
      t.integer :google_map_id
    end

    add_index :locations, :latitude
    add_index :locations, :longitude
    add_index :locations, :state_code
    add_index :locations, [:zip_5,:zip_4]
    
    create_table :travel_plans do |t|
      t.integer :courier_id, null: false
      t.timestamp :start_time, null: false
      t.timestamp :end_time
      t.timestamp :start_date, null: false
      t.timestamp :end_date
      t.string :destination, null: false
    end

    add_index :travel_plans, [:start_date, :end_date]
    
    create_table :requests do |t|
      t.integer :beneficiary_id, null: false
      t.integer :requestor_id, null: false
      t.timestamp :start_time
      t.timestamp :end_time
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :status, null: false, limit: 32
    end

    add_index :requests, [:start_date, :end_date]
    
    create_table :payments do |t|
      t.integer :exchange_id, null: false
      t.decimal :amount, null: false, precision: 14, scale: 2
    end

    add_index :payments, :exchange_id, unique: true

    create_table :long_strings do |t|
      t.string :describable_type, limit: 64
      t.integer :describable_id, null: false
      t.string :attribute_name, null: false
      t.text :content
    end

    add_index :long_strings, [:describable_id, :attribute_name]

  end

  def down
    "n/a"
  end
end
