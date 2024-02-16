# == Schema Information
#
# Table name: species
#
#  id         :integer          not null, primary key
#  diet       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Species < ApplicationRecord
  has_rich_text :description

  validates :name, presence: true

  def self.publish_data
    all.with_rich_text_description_and_embeds.map do |species|
      species.as_json.merge({ description: species.description.body.to_s })
    end
  end

  def self.publish_types
    attrs = {
      id: "number",
      name: "string",
      description: "string",
      created_at: "Date",
      updated_at: "Date"
    }

    types = ""

    types += "export default interface Species {\n"
    attrs.each do |attr, type|
      types += "  #{attr}: #{type}\n"
    end
    types += "}\n"

    types
  end
end
