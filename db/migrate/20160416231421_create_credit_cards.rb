class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
