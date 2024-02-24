# frozen_string_literal: true

# == Schema Information
#
# Table name: fauna
#
#  id           :integer          not null, primary key
#  diet         :string
#  habitat      :string
#  map_link     :string
#  name         :string
#  threat_model :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Fauna < ApplicationRecord
  include Publishable

  has_rich_text :description

  validates :name, presence: true
  validates :diet, presence: true
  validates :habitat, presence: true
end
