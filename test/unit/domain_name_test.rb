require 'test_helper'

class DomainNameTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: domain_names
#
#  id                          :integer         not null, primary key
#  fully_qualified_domain_name :string(255)
#  description                 :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#

