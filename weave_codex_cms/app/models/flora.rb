# frozen_string_literal: true

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
  include Publishable

  has_rich_text :description

  validates :name, presence: true
end
