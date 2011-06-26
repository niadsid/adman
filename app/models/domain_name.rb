class DomainName < ActiveRecord::Base
  has_many :domain_mappings
  has_many :addresses, :through => :domain_mappings
end
