class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :trip, foreign_key: true, null: false
      t.string :description, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.text :notes
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
