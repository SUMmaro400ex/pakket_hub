class InitialSchema < ActiveRecord::Migration
  def up

    create_table :contacts do |t|
      t.string :name
      t.string :surname
    end

    add_index :contacts, [:surname, :name]

    create_table :contact_phone_numbers do |t|
      t.string :type, limit: 64
      t.string :contact_id
      t.string :phone_number_id
      t.string :status, limit: 32
    end

    add_index :contact_phone_numbers, :phone_number_id
    add_index :contact_phone_numbers, :contact_id

    create_table :phone_numbers do |t|
      t.string :country_code
      t.string :area_code, limit: 3
      t.string :subscriber_number
    end

    add_index :phone_numbers, [:area_code, :subscriber_number, :country_code], unique: true, name: :main_idx

    create_table :packages do |t|
      t.integer :exchange_id
      t.integer :request_id
      t.string :status, limit: 32
    end

    add_index :packages, :exchange_id
    add_index :packages, :request_id

    create_table :exchanges do |t|
      t.integer :beneficiary_id
      t.integer :courier_id
      t.integer :request_id
      t.string :status, limit: 32
    end

    add_index :exchanges, :beneficiary_id
    add_index :exchanges, :courier_id
    add_index :exchanges, :request_id

    create_table :exchange_locations do |t|
      t.integer :exchange_id
      t.integer :location_id
      t.string :status, limit: 32
    end

    add_index :exchange_locations, :exchange_id
    add_index :exchange_locations, :location_id

    create_table :locations do |t|
      t.string :city, limit: 64
      t.string :country, limit: 2
      t.string :state_code, limit: 2
      t.string :descriptive_key
      t.decimal :latitude, precision: 7, scale: 5
      t.decimal :longitude, precision: 7, scale: 5
      t.integer :google_map_id
    end

    add_index :locations, :descriptive_key
    add_index :locations, :latitude
    add_index :locations, :longitude
    add_index :locations, :state_code

    create_table :travel_plans do |t|
      t.integer :courier_id
      t.integer :location_id
      t.integer :destination_id
      t.integer :radius
      t.timestamp :start_time
      t.timestamp :end_time
      t.date :start_date
      t.date :end_date
    end

    add_index :travel_plans, [:start_date, :end_date]

    create_table :requests do |t|
      t.integer :beneficiary_id
      t.integer :requestor_id
      t.integer :location_id
      t.integer :radius
      t.timestamp :start_time
      t.timestamp :end_time
      t.date :start_date
      t.date :end_date
      t.string :status, limit: 32
    end

    add_index :requests, [:start_date, :end_date]

    create_table :payments do |t|
      t.integer :exchange_id
      t.decimal :amount, precision: 14, scale: 2
    end

    add_index :payments, :exchange_id, unique: true

    create_table :long_strings do |t|
      t.string :describable_type, limit: 64
      t.integer :describable_id
      t.string :attribute_name
      t.text :content
    end

    add_index :long_strings, [:describable_id, :attribute_name]

  end

  def down
    "n/a"
  end
end
