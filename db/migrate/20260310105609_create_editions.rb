class CreateEditions < ActiveRecord::Migration[8.1]
  def change
    create_table :editions do |t|
      t.integer :year, null: false
      t.datetime :date, null: false
      t.datetime :registration_starts_at
      t.datetime :registration_ends_at
      t.integer :max_capacity, default: 500
      t.decimal :entry_fee, precision: 8, scale: 2, default: 10.00

      t.boolean :published, default: false, null: false

      t.timestamps
    end

    add_index :editions, :year, unique: true
    add_index :editions, :published
  end
end
