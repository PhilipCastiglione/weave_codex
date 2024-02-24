# frozen_string_literal: true

# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  map_link   :string
#  name       :string
#  population :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  domain_id  :integer          not null
#
# Indexes
#
#  index_cities_on_domain_id  (domain_id)
#
# Foreign Keys
#
#  domain_id  (domain_id => domains.id)
#
class City < ApplicationRecord
  include Publishable

  belongs_to :domain
  has_and_belongs_to_many :organizations

  has_rich_text :description

  validates :name, presence: true
  validates :population, presence: true
end
