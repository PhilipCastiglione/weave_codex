class CreateFaunas < ActiveRecord::Migration[7.1]
  def change
    create_table :faunas do |t|
      t.string :name

      t.timestamps
    end
  end
end
