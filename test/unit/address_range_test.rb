require 'test_helper'

class AddressRangeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: address_ranges
#
#  id            :integer         not null, primary key
#  first_address :string(255)
#  last_address  :string(255)
#  description   :string(255)
#  subnet_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

