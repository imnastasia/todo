class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps

      t.index [:user_id, :name], unique: true
    end
  end
end
