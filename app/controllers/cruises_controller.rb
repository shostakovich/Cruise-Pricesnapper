class CruisesController < ApplicationController
  # GET /cruises
  # GET /cruises.json
  def index
    @cruises = Cruise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cruises }
    end
  end

  # GET /cruises/1
  # GET /cruises/1.json
  def show
    @cruise = Cruise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cruise }
    end
  end

  # GET /cruises/new
  # GET /cruises/new.json
  def new
    @cruise = Cruise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cruise }
    end
  end

  # GET /cruises/1/edit
  def edit
    @cruise = Cruise.find(params[:id])
  end

  # POST /cruises
  # POST /cruises.json
  def create
    @cruise = Cruise.new(params[:cruise])

    respond_to do |format|
      if @cruise.save
        format.html { redirect_to @cruise, notice: 'Cruise was successfully created.' }
        format.json { render json: @cruise, status: :created, location: @cruise }
      else
        format.html { render action: "new" }
        format.json { render json: @cruise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cruises/1
  # PUT /cruises/1.json
  def update
    @cruise = Cruise.find(params[:id])

    respond_to do |format|
      if @cruise.update_attributes(params[:cruise])
        format.html { redirect_to @cruise, notice: 'Cruise was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cruise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cruises/1
  # DELETE /cruises/1.json
  def destroy
    @cruise = Cruise.find(params[:id])
    @cruise.destroy

    respond_to do |format|
      format.html { redirect_to cruises_url }
      format.json { head :ok }
    end
  end
end
