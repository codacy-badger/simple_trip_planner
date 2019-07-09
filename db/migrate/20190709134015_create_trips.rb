class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.text :notes

      t.timestamps
    end
  end
end
