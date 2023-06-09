# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.integer :group_id
      t.string :name, null: false
      t.integer :amount, null: false
      # t.datetime :create_at
      t.references :user, null: false, foreign_key: true
      # t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
