class AddGeoData < ActiveRecord::Migration
  def change
    change_table(:requests) do |t|
      t.integer :size_code
    end

    change_table(:travel_plans) do |t|
      t.integer :size_code
    end

  end
end
