require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: sites
#
#  id          :integer         not null, primary key
#  site_name   :string(255)
#  network_id  :integer
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

