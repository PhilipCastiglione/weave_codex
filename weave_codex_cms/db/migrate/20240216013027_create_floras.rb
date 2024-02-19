# frozen_string_literal: true

class CreateFloras < ActiveRecord::Migration[7.1]
  def change
    create_table :floras do |t|
      t.string :name
      t.string :habitat

      t.timestamps
    end
  end
end
