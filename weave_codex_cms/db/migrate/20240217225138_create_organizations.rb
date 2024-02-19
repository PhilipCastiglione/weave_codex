# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :classification
      t.integer :membership_numbers
      t.references :domain, null: false, foreign_key: true
      t.references :parent, null: true, foreign_key: { to_table: :organizations }

      t.timestamps
    end
  end
end
