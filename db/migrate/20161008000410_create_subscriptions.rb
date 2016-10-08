class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :sub_id, index: true, null: false
      t.integer :user_id, index: true, null: false

      t.timestamps null: false
    end

    add_index :subscriptions, [:sub_id, :user_id], unique: true
  end
end
