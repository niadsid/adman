class Site < ActiveRecord::Base
  attr_accessible :site_name, :network_id, :description
  
  belongs_to :network
  has_many :subnets
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

