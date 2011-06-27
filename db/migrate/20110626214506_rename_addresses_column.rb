class RenameAddressesColumn < ActiveRecord::Migration
  def self.up
    change_table :addresses do |t|
      t.rename :nat_address_range_id, :address_range_id
    end
  end

  def self.down
    change_table :addresses do |t|
      t.rename :address_range_id, :nat_address_range_id
    end 
  end
end
