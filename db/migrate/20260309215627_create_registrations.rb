class CreateRegistrations < ActiveRecord::Migration[8.1]
  def change
    create_table :registrations do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birth_date, null: false
      t.string :gender, null: false
      t.string :city, null: false
      t.string :phone, null: false
      t.string :email, null: false

      t.string :discipline, null: false
      t.string :category, null: false
      t.string :club
      t.string :t_shirt_size, null: false

      t.boolean :gdpr_consent, null: false, default: false
      t.boolean :terms_consent, null: false, default: false

      t.timestamps
    end
  end
end
