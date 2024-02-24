# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id                 :integer          not null, primary key
#  classification     :string
#  map_link           :string
#  membership_numbers :integer
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  domain_id          :integer          not null
#  parent_id          :integer
#
# Indexes
#
#  index_organizations_on_domain_id  (domain_id)
#  index_organizations_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  domain_id  (domain_id => domains.id)
#  parent_id  (parent_id => organizations.id)
#
require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
