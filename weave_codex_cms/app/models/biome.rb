# frozen_string_literal: true

# == Schema Information
#
# Table name: biomes
#
#  id         :integer          not null, primary key
#  map_link   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Biome < ApplicationRecord
  include Publishable

  has_rich_text :description

  validates :name, presence: true
end
