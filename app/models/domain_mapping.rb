class DomainMapping < ActiveRecord::Base
  belongs_to :address
  belongs_to :domain_name
end
