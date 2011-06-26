class Subnet < ActiveRecord::Base
  belongs_to :site
  has_many :addresses
  has_many :address_ranges
end
