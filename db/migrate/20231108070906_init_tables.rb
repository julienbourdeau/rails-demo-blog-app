class InitTables < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.datetime :published_at
      t.timestamps
    end

    create_table :authors do |t|
      t.string :full_name, null: false
      t.boolean :distinguished, default: false, null: false
      t.timestamps
    end

    create_table :post_authors do |t|
      t.belongs_to :post
      t.belongs_to :author
      t.timestamps
    end

    create_table :reactions do |t|
      t.belongs_to :post
      t.string :name, null: false, index: true
    end
  end
end
