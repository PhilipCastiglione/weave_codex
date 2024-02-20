# frozen_string_literal: true

class CreateJoinTableCityOrganization < ActiveRecord::Migration[7.1]
  def change
    create_join_table :cities, :organizations do |t|
      t.index %i[city_id organization_id]
      t.index %i[organization_id city_id]
    end
  end
end
