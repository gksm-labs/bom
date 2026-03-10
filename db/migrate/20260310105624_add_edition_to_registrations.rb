class AddEditionToRegistrations < ActiveRecord::Migration[8.1]
  def change
    add_reference :registrations, :edition, null: false, foreign_key: true
    add_index :registrations, [ :edition_id, :bib_number ], unique: true
  end
end
