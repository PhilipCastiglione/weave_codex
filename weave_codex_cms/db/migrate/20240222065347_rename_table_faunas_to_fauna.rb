# frozen_string_literal: true

class RenameTableFaunasToFauna < ActiveRecord::Migration[7.1]
  def change
    rename_table :faunas, :fauna
  end
end
