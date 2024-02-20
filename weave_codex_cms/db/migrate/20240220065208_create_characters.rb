# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :species, null: false, foreign_key: true
      t.references :domain, null: false, foreign_key: true
      t.references :organization, null: true, foreign_key: true

      t.timestamps
    end
  end
end
