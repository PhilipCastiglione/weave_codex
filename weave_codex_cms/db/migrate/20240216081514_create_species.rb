class CreateSpecies < ActiveRecord::Migration[7.1]
  def change
    create_table :species do |t|
      t.string :name
      t.string :diet

      t.timestamps
    end
  end
end