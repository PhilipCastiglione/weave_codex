# frozen_string_literal: true

class RenameMapRegionColumnsToMapLink < ActiveRecord::Migration[7.1]
  def change
    rename_column :biomes, :map_region, :map_link
    rename_column :cities, :map_region, :map_link
    rename_column :domains, :map_region, :map_link
    rename_column :fauna, :map_region, :map_link
    rename_column :flora, :map_region, :map_link
    rename_column :organizations, :map_region, :map_link
  end
end
