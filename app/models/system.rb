class System < ActiveRecord::Base
  attr_accessible :system_name, :location, :description 
    
  has_many :interfaces
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

