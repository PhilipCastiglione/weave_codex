# == Schema Information
#
# Table name: floras
#
#  id         :integer          not null, primary key
#  habitat    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Flora < ApplicationRecord
  has_rich_text :description
  
  validates :name, presence: true

  def self.publish_data
    all.with_rich_text_description_and_embeds.map do |flora|
      flora.as_json.merge({ description: flora.description.body.to_s })
    end
  end

  def self.publish_types
    attrs = {
      id: "number",
      habitat: "string",
      name: "string",
      description: "string",
      created_at: "Date",
      updated_at: "Date"
    }

    types = ""

    types += "export default interface Flora {\n"
    attrs.each do |attr, type|
      types += "  #{attr}: #{type}\n"
    end
    types += "}\n"

    types
  end
end
