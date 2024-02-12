# == Schema Information
#
# Table name: faunas
#
#  id           :integer          not null, primary key
#  diet         :string
#  habitat      :string
#  name         :string
#  threat_model :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Fauna < ApplicationRecord
  has_rich_text :description
  
  validates :name, presence: true
  # diet types: https://en.wikipedia.org/wiki/List_of_feeding_behaviours

  def self.publish_data
    all.with_rich_text_description_and_embeds.map do |fauna|
      fauna.as_json.merge({ description: fauna.description.body.to_s })
    end
  end

  def as_json
    {
      id: id,
      name: name,
      description: description.to_s
    }
  end
end
