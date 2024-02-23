# frozen_string_literal: true

class CreateMapRegionColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :biomes, :map_region, :string
    add_column :cities, :map_region, :string
    add_column :domains, :map_region, :string
    add_column :fauna, :map_region, :string
    add_column :flora, :map_region, :string
    add_column :organizations, :map_region, :string
  end
end
