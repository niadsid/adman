class InterfacesController < ApplicationController
  # GET /interfaces/data.xml
  def data
    @interfaces = Interface.all
  end
  
  # GET /interfaces/dbaction.xml
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
            interface = Interface.new
            interface.network_address = network_address
            interface.mask_length = mask_length
            interface.description = description
            interface.save!
            
            @tid = address.id
        when "deleted"
            interface=Interface.find(@id)
            interface.destroy
            
            @tid = @id
        when "updated"
            interface=Interface.find(@id)
            interface.network_address = network_address
            interface.mask_length = mask_length
            interface.description = description
            interface.save!
            
            @tid = @id
    end 
  end

  # GET /interfaces
  # GET /interfaces.xml
  def index
    @interfaces = Interface.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interfaces }
    end
  end

  # GET /interfaces/1
  # GET /interfaces/1.xml
  def show
    @interface = Interface.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interface }
    end
  end

  # GET /interfaces/new
  # GET /interfaces/new.xml
  def new
    @interface = Interface.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interface }
    end
  end

  # GET /interfaces/1/edit
  def edit
    @interface = Interface.find(params[:id])
  end

  # POST /interfaces
  # POST /interfaces.xml
  def create
    @interface = Interface.new(params[:interface])

    respond_to do |format|
      if @interface.save
        format.html { redirect_to(@interface, :notice => 'Interface was successfully created.') }
        format.xml  { render :xml => @interface, :status => :created, :location => @interface }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interface.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interfaces/1
  # PUT /interfaces/1.xml
  def update
    @interface = Interface.find(params[:id])

    respond_to do |format|
      if @interface.update_attributes(params[:interface])
        format.html { redirect_to(@interface, :notice => 'Interface was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interface.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interfaces/1
  # DELETE /interfaces/1.xml
  def destroy
    @interface = Interface.find(params[:id])
    @interface.destroy

    respond_to do |format|
      format.html { redirect_to(interfaces_url) }
      format.xml  { head :ok }
    end
  end
end
