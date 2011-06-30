require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  network_address  :string(255)
#  mask_length      :integer
#  description      :string(255)
#  virtual_ip       :boolean
#  subnet_id        :integer
#  interface_id     :integer
#  nat_address_id   :integer
#  address_range_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

