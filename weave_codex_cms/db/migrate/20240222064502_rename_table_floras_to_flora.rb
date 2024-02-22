# frozen_string_literal: true

class RenameTableFlorasToFlora < ActiveRecord::Migration[7.1]
  def change
    rename_table :floras, :flora
  end
end
