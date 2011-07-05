class DomainNamesController < ApplicationController
  # GET /domain_names/data.xml
  def data
    @domain_names = Domain_name.all
  end
  
  # GET /domain_names/dbaction.xml
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
            domain_name = Domain_name.new
            domain_name.network_address = network_address
            domain_name.mask_length = mask_length
            domain_name.description = description
            domain_name.save!
            
            @tid = domain_name.id
        when "deleted"
            domain_name=Domain_name.find(@id)
            domain_name.destroy
            
            @tid = @id
        when "updated"
            domain_name=Domain_name.find(@id)
            domain_name.network_address = network_address
            domain_name.mask_length = mask_length
            domain_name.description = description
            domain_name.save!
            
            @tid = @id
    end 
  end
  
  # GET /domain_names
  # GET /domain_names.xml
  def index
    @domain_names = DomainName.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domain_names }
    end
  end

  # GET /domain_names/1
  # GET /domain_names/1.xml
  def show
    @domain_name = DomainName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @domain_name }
    end
  end

  # GET /domain_names/new
  # GET /domain_names/new.xml
  def new
    @domain_name = DomainName.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @domain_name }
    end
  end

  # GET /domain_names/1/edit
  def edit
    @domain_name = DomainName.find(params[:id])
  end

  # POST /domain_names
  # POST /domain_names.xml
  def create
    @domain_name = DomainName.new(params[:domain_name])

    respond_to do |format|
      if @domain_name.save
        format.html { redirect_to(@domain_name, :notice => 'Domain name was successfully created.') }
        format.xml  { render :xml => @domain_name, :status => :created, :location => @domain_name }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @domain_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /domain_names/1
  # PUT /domain_names/1.xml
  def update
    @domain_name = DomainName.find(params[:id])

    respond_to do |format|
      if @domain_name.update_attributes(params[:domain_name])
        format.html { redirect_to(@domain_name, :notice => 'Domain name was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @domain_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_names/1
  # DELETE /domain_names/1.xml
  def destroy
    @domain_name = DomainName.find(params[:id])
    @domain_name.destroy

    respond_to do |format|
      format.html { redirect_to(domain_names_url) }
      format.xml  { head :ok }
    end
  end
end
