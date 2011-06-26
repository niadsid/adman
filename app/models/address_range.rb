class AddressRange < ActiveRecord::Base
  belongs_to :subnet
  has_many :addresses
end
