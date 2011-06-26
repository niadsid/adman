class AddressRangesController < ApplicationController
  # GET /address_ranges
  # GET /address_ranges.xml
  def index
    @address_ranges = AddressRange.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_ranges }
    end
  end

  # GET /address_ranges/1
  # GET /address_ranges/1.xml
  def show
    @address_range = AddressRange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address_range }
    end
  end

  # GET /address_ranges/new
  # GET /address_ranges/new.xml
  def new
    @address_range = AddressRange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_range }
    end
  end

  # GET /address_ranges/1/edit
  def edit
    @address_range = AddressRange.find(params[:id])
  end

  # POST /address_ranges
  # POST /address_ranges.xml
  def create
    @address_range = AddressRange.new(params[:address_range])

    respond_to do |format|
      if @address_range.save
        format.html { redirect_to(@address_range, :notice => 'Address range was successfully created.') }
        format.xml  { render :xml => @address_range, :status => :created, :location => @address_range }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /address_ranges/1
  # PUT /address_ranges/1.xml
  def update
    @address_range = AddressRange.find(params[:id])

    respond_to do |format|
      if @address_range.update_attributes(params[:address_range])
        format.html { redirect_to(@address_range, :notice => 'Address range was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /address_ranges/1
  # DELETE /address_ranges/1.xml
  def destroy
    @address_range = AddressRange.find(params[:id])
    @address_range.destroy

    respond_to do |format|
      format.html { redirect_to(address_ranges_url) }
      format.xml  { head :ok }
    end
  end
end
