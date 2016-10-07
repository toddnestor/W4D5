class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :author_id, null: false
      t.references :post, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :comments, :author_id
  end
end
