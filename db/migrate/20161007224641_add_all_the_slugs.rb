class AddAllTheSlugs < ActiveRecord::Migration
  def change
    add_column :subs, :slug, :string, unique: true
    add_column :posts, :slug, :string, unique: true
    add_column :users, :slug, :string, unique: true
  end
end
