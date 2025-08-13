class CreateBlogTables < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :slug, null: false
      t.boolean :published, default: false
      t.datetime :published_at
      t.references :author, null: true, foreign_key: { to_table: :users }
      t.references :category, null: true, foreign_key: { to_table: :blog_categories }

      t.timestamps
    end

    add_index :blog_posts, :slug, unique: true
    add_index :blog_posts, :published

    create_table :blog_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description

      t.timestamps
    end

    add_index :blog_categories, :slug, unique: true

    create_table :blog_tags do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps
    end

    add_index :blog_tags, :slug, unique: true

    create_table :blog_post_tags do |t|
      t.references :post, null: false, foreign_key: { to_table: :blog_posts }
      t.references :tag, null: false, foreign_key: { to_table: :blog_tags }

      t.timestamps
    end

    add_index :blog_post_tags, [:post_id, :tag_id], unique: true

    create_table :blog_comments do |t|
      t.text :content, null: false
      t.boolean :approved, default: false
      t.references :post, null: false, foreign_key: { to_table: :blog_posts }
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :blog_comments, :approved
  end
end 