# == Schema Information
#
# Table name: organizations
#
#  id                 :integer          not null, primary key
#  classification     :string
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
  belongs_to :domain
  belongs_to :parent, class_name: "Organization", optional: true
  has_many :children, class_name: "Organization", foreign_key: "parent_id", dependent: :nullify

  has_rich_text :description
  
  validates :name, presence: true

  def self.publish_data
    all.includes(:domain, :parent, :children).with_all_rich_text.map do |organization|
      organization.as_json.merge({
        domain_id: organization.domain_id,
        parent_id: organization.parent_id,
        children_ids: organization.children.map(&:id),
        description: organization.description.body.to_s,
      })
    end
  end

  def self.publish_types
    attrs = {
      id: "number",
      name: "string",
      domain_id: "number",
      parent_id: "number",
      children_ids: "number[]",
      description: "string",
      created_at: "Date",
      updated_at: "Date"
    }

    types = ""

    types += "export default interface Domain {\n"
    attrs.each do |attr, type|
      types += "  #{attr}: #{type}\n"
    end
    types += "}\n"

    types
  end
end
