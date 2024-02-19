# == Schema Information
#
# Table name: faunas
#
#  id           :integer          not null, primary key
#  diet         :string
#  habitat      :string
#  name         :string
#  threat_model :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Fauna < ApplicationRecord
  include Publishable

  has_rich_text :description
  
  validates :name, presence: true
end
