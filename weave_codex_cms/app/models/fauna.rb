class Fauna < ApplicationRecord
  has_rich_text :description

  def self.publish_data
    all.with_rich_text_description_and_embeds.as_json
  end
end
