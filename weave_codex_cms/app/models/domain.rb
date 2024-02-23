# frozen_string_literal: true

# == Schema Information
#
# Table name: domains
#
#  id         :integer          not null, primary key
#  map_region :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Domain < ApplicationRecord
  include Publishable

  has_and_belongs_to_many :species
  has_many :organizations, dependent: :destroy
  has_many :cities, dependent: :destroy
  has_many :characters, dependent: :destroy

  has_rich_text :description
  has_rich_text :sociocultural
  has_rich_text :politics_economics_and_law
  has_rich_text :philosophy_religion_and_magic

  validates :name, presence: true
end
