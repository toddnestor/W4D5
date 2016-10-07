class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.references :votable, index: true, polymorphic: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
