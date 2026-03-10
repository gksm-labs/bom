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

      # Using 'content' instead of ops's 'text' and 'raw' approach for simplicity,
      # but you can rename this to 'text' if you want to perfectly match the ops schema.
      t.text :content, null: false

      # Using a simple boolean for publishing instead of ops's Postgres Array tags
      t.boolean :published, default: false, null: false

      t.timestamps
    end

    add_index :cms_pages, :slug, unique: true
  end
end
