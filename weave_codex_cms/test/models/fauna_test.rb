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
require "test_helper"

class FaunaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
