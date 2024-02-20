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
require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
