class CreateCatsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.date :birth_date
      t.string :color
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description
      t.timestamps
    end
  end
end
