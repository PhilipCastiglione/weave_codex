# frozen_string_literal: true

class CreateBiomes < ActiveRecord::Migration[7.1]
  def change
    create_table :biomes do |t|
      t.string :name

      t.timestamps
    end
  end
end
