require 'test_helper'

class DomainMappingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: domain_mappings
#
#  id             :integer         not null, primary key
#  domain_name_id :integer
#  address_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

