class AddressesController < ApplicationController
  
  # GET /addresses/data.xml
  def data
    @addresses = Address.all
  end

  # GET /addresses/dbaction.xml
  def dbaction # supporting code for dhtmlx db/grid
    #called for all db actions
    network_address = params["c0"]
    mask_length     = params["c1"]
    fqdn            = params["c2"]
    description     = params["c3"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address = Address.new
            address.network_address = network_address
            address.mask_length = mask_length
            address.description = description
            address.save!
            
            @tid = address.id
        when "deleted"
            address=Address.find(@id)
            address.destroy
            
            @tid = @id
        when "updated"
            address=Address.find(@id)
            address.network_address = network_address
            address.mask_length = mask_length
            address.description = description
            address.save!
            
            @tid = @id
    end 
  end

  # GET /addresses
  # GET /addresses.xml
  def index
    @addresses = Address.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
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
