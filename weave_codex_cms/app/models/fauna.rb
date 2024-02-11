# == Schema Information
#
# Table name: faunas
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Fauna < ApplicationRecord
  has_rich_text :description

  def self.publish_data
    all.with_rich_text_description_and_embeds.as_json
  end

  def as_json
    {
      id: id,
      name: name,
      description: description.to_s
    }
  end
end
