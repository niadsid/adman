require 'test_helper'

class InterfaceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: interfaces
#
#  id             :integer         not null, primary key
#  interface_name :string(255)
#  layer2_address :string(255)
#  description    :string(255)
#  system_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

