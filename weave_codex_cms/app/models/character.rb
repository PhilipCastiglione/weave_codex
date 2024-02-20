# frozen_string_literal: true

# == Schema Information
#
# Table name: characters
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  domain_id       :integer          not null
#  organization_id :integer
#  species_id      :integer          not null
#
# Indexes
#
#  index_characters_on_domain_id        (domain_id)
#  index_characters_on_organization_id  (organization_id)
#  index_characters_on_species_id       (species_id)
#
# Foreign Keys
#
#  domain_id        (domain_id => domains.id)
#  organization_id  (organization_id => organizations.id)
#  species_id       (species_id => species.id)
#
class Character < ApplicationRecord
  include Publishable

  belongs_to :species
  belongs_to :domain
  belongs_to :organization

  has_rich_text :background
  has_rich_text :physical_description
  has_rich_text :personality
  has_rich_text :other_notes

  validates :name, presence: true
end
