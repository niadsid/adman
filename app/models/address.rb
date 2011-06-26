class Address < ActiveRecord::Base
  belongs_to :subnet
  belongs_to :interface
  has_many :domain_mappings
  has_many :domains_names, :through => :domain_mappings
end
