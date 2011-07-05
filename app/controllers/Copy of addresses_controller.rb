class AddressesController < ApplicationController

  # GET /addresses
  # GET /addresses.xml
  def index
   # @addresses = Address.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => Address.all }
  #    format.xml  { render :xml => @addresses }
  # Test Flexigrid code start
  
      # With the Flexigrid, we need to render Json data
      format.js do
        # What is the first line of the result set we want ? (due to pagination. 0 = first)
        offset = (params["page"].to_i-1)*params["rp"].to_i if params["page"] and params["rp"]

        # Conditions passed by flexigrid
        conditions = [params["qtype"]+"=?", params["query"]] if params["query"] and params["query"].strip!=""
        addresses = Address.where(conditions)

        # Total count of lines, before paginating
        total = addresses.count

        # People from the page
        addresses_per_page = addresses
          .order([params["sortname"], params["sortorder"]].join(" "))
          .offset(offset)
          .limit(params["rp"]).all
        
        # Rendering
        render :json => {
            # return a JSON collection associated to "rows" , 
            # where each item contains the id 
            # and a cell hash containing an array of the attributes of the object (which will fill the cells of the row).
            :rows=>addresses_per_page.collect{|r| {:id=>r.id, :cell=>[r.network_address, r.fqdn, r.subnet.subnet_name, r.description]}}, 
            :page=>params["page"],
            :total=>total
          }.to_json
          
      end #format.js
  
  # Test Flexigrid code start
    end
  end

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to(@address, :notice => 'Address was successfully created.') }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to(@address, :notice => 'Address was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml  { head :ok }
    end
  end
  
end
