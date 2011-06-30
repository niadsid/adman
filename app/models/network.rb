class Network < ActiveRecord::Base
  attr_accessible :network_name, :description
  
  has_many :sites
end

# == Schema Information
#
# Table name: networks
#
#  id           :integer         not null, primary key
#  network_name :string(255)
#  description  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

