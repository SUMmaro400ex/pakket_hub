class AddGeoData < ActiveRecord::Migration
  def change
    change(:requests) do |t|
      t.integer :size_code
    end

    change(:travel_plans) do |t|
      t.integer :size_code
    end

  end
end
