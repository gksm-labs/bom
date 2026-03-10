class CreateCmsTables < ActiveRecord::Migration[8.1]
  def change
    create_table :cms_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.references :parent_category, foreign_key: { to_table: :cms_categories }

      t.timestamps
    end

    add_index :cms_categories, :slug, unique: true

    create_table :cms_pages do |t|
      t.references :category, null: false, foreign_key: { to_table: :cms_categories }
      t.string :title, null: false
      t.string :slug, null: false

      t.text :content, null: false

      t.boolean :published, default: false, null: false

      t.timestamps
    end

    add_index :cms_pages, :slug, unique: true
  end
end
