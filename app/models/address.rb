class Address < ActiveRecord::Base
  belongs_to :subnet
  belongs_to :interface
  belongs_to :address_range
  has_many :domain_mappings
  has_many :domains_names, :through => :domain_mappings
  has_one :nat_address, :class_name => "Address", :foreign_key => "nat_address_id"
  belongs_to :address
end
