xml.instruct! :xml, :version=>"1.0"

xml.tree("id" => "0") do
	xml.item("text" => "Networks", "id" => "Networks", "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => "one") do
		@networks.each do |network|
			xml.item("text" => network.network_name, "id" => network.network_name, "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => network.network_name) do
				network.sites.each do |site|
					xml.item("text" => site.site_name, "id" => network.network_name+site.site_name, "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => site.site_name) do
						site.subnets.each do |subnet|
							xml.item("text" => subnet.friendly_descriptor, "id" => network.network_name+site.site_name+subnet.subnet_name, "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => subnet.subnet_name) do
								subnet.addresses.each do |address|
									xml.item("text" => address.friendly_descriptor, "id" => network.network_name+site.site_name+subnet.subnet_name+address.network_address, "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => address.friendly_descriptor)
								end
							end
						end
					end
				end
			end
		end
	end
end
