# frozen_string_literal: true

# == Schema Information
#
# Table name: flora
#
#  id         :integer          not null, primary key
#  habitat    :string
#  map_link   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Flora < ApplicationRecord
  include Publishable

  has_rich_text :description

  validates :name, presence: true
  validates :habitat, presence: true
end
