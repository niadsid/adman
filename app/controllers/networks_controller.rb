class NetworksController < ApplicationController

  # GET /networks/tree.xml
  def tree
    @networks = Network.all

  end
  
  # GET /networks/data.xml
  def data
    @networks = Network.all
  end
  
  # GET /networks/dbaction.xml
  def dbaction # supporting code for dhtmlx db/grid
    #called for all db actions
    network_name      = params["c0"]
    member_sites      = params["c1"]
    description       = params["c2"]
  
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            network               = Network.new
            network.natwork_name  = network_name
            network.description   = description
            network.save!
            
            @tid = address.id
        when "deleted"
            network=Network.find(@id)
            network.destroy
            
            @tid = @id
        when "updated"
            network=Network.find(@id)
            network.network_name = network_name
            network.description = description
            network.save!
            
            @tid = @id
    end 
  end
  
  # GET /networks
  # GET /networks.xml
  def index
    @networks = Network.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @networks }
    end
  end

  # GET /networks/1
  # GET /networks/1.xml
  def show
    @network = Network.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @network }
    end
  end

  # GET /networks/new
  # GET /networks/new.xml
  def new
    @network = Network.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @network }
    end
  end

  # GET /networks/1/edit
  def edit
    @network = Network.find(params[:id])
  end

  # POST /networks
  # POST /networks.xml
  def create
    @network = Network.new(params[:network])

    respond_to do |format|
      if @network.save
        format.html { redirect_to(@network, :notice => 'Network was successfully created.') }
        format.xml  { render :xml => @network, :status => :created, :location => @network }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @network.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /networks/1
  # PUT /networks/1.xml
  def update
    @network = Network.find(params[:id])

    respond_to do |format|
      if @network.update_attributes(params[:network])
        format.html { redirect_to(@network, :notice => 'Network was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @network.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.xml
  def destroy
    @network = Network.find(params[:id])
    @network.destroy

    respond_to do |format|
      format.html { redirect_to(networks_url) }
      format.xml  { head :ok }
    end
  end
end
