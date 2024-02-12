class AddFieldsToFauna < ActiveRecord::Migration[7.1]
  def change
    add_column :faunas, :diet, :string
    add_column :faunas, :habitat, :string
    add_column :faunas, :threat_model, :string
  end
end
