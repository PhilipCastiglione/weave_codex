# frozen_string_literal: true

class CreateJoinTableDomainSpecies < ActiveRecord::Migration[7.1]
  def change
    create_join_table :domains, :species do |t|
      t.index %i[domain_id species_id]
      t.index %i[species_id domain_id]
    end
  end
end
