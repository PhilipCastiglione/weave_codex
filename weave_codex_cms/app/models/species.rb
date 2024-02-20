# frozen_string_literal: true

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
  include Publishable

  has_and_belongs_to_many :domains
  has_many :characters, dependent: :destroy

  has_rich_text :description

  validates :name, presence: true
end
