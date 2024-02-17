class CreateJoinTableDomainSpecies < ActiveRecord::Migration[7.1]
  def change
    create_join_table :domains, :species do |t|
      t.index [:domain_id, :species_id]
      t.index [:species_id, :domain_id]
    end
  end
end
