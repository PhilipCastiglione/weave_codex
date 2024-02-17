# == Schema Information
#
# Table name: domains
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Domain < ApplicationRecord
  has_rich_text :description
  has_rich_text :sociocultural
  has_rich_text :politics_economics_and_law
  has_rich_text :philosophy_religion_and_magic
  
  validates :name, presence: true

  def self.publish_data
    all.with_all_rich_text.map do |domain|
      domain.as_json.merge({
        description: domain.description.body.to_s,
        sociocultural: domain.sociocultural.body.to_s,
        politics_economics_and_law: domain.politics_economics_and_law.body.to_s,
        philosophy_religion_and_magic: domain.philosophy_religion_and_magic.body.to_s,
      })
    end
  end

  def self.publish_types
    attrs = {
      id: "number",
      name: "string",
      description: "string",
      sociocultural: "string",
      politics_economics_and_law: "string",
      philosophy_religion_and_magic: "string",
      created_at: "Date",
      updated_at: "Date"
    }

    types = ""

    types += "export default interface Domain {\n"
    attrs.each do |attr, type|
      types += "  #{attr}: #{type}\n"
    end
    types += "}\n"

    types
  end
end
