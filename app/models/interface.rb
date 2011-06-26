class Interface < ActiveRecord::Base
  belongs_to :system
  has_many :addresses
end
