class CreateCatRentalRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, default: "PENDING"
      t.index :cat_id
    end
  end
end
