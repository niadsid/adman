require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: systems
#
#  id          :integer         not null, primary key
#  system_name :string(255)
#  location    :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

