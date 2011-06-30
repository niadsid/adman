require 'test_helper'

class SubnetTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: subnets
#
#  id                :integer         not null, primary key
#  subnet_name       :string(255)
#  subnet_identifier :string(255)
#  mask_length       :string(255)
#  default_router    :string(255)
#  description       :string(255)
#  site_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

