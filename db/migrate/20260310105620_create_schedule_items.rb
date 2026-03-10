class CreateScheduleItems < ActiveRecord::Migration[8.1]
  def change
    create_table :schedule_items do |t|
      t.references :edition, null: false, foreign_key: true
      t.time :start_time
      t.string :title
      t.text :description
      t.string :badge_color

      t.timestamps
    end
  end
end
