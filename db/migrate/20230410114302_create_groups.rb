class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :icon
      t.datetime :create_at
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
