# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id                 :integer          not null, primary key
#  classification     :string
#  map_region         :string
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
class Organization < ApplicationRecord
  include Publishable

  belongs_to :domain
  belongs_to :parent, class_name: 'Organization', optional: true
  has_many :children, class_name: 'Organization', foreign_key: 'parent_id', dependent: :nullify
  has_many :characters, dependent: :nullify
  has_and_belongs_to_many :cities

  has_rich_text :description

  validates :name, presence: true
  validates :classification, presence: true
end
