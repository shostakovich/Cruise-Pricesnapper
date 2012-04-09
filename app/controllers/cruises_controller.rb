require File.expand_path('../../../lib/cruise_price_sampler', __FILE__)
require File.expand_path('../../../lib/cruise_populator', __FILE__)

class CruisesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if sort_column == "status"
      @cruises = Cruise.all(:order => "(first_price - last_price) " + sort_direction)
    else
      @cruises = Cruise.all(:order => sort_column + " " + sort_direction)
    end
  end

  def show
    @cruise = Cruise.find(params[:id])
  end

  def new
    @cruise = Cruise.new
  end

  def edit
    @cruise = Cruise.find(params[:id])
  end

  def create
    @cruise = Cruise.new(params[:cruise])
    @cruise = CruisePopulator.populate(@cruise)
    
    if @cruise.save
      sampler = CruisePriceSampler.new(@cruise)
      sampler.take_sample
      redirect_to @cruise, notice: 'Cruise was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @cruise = Cruise.find(params[:id])

    if @cruise.update_attributes(params[:cruise])
      redirect_to @cruise, notice: 'Cruise was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @cruise = Cruise.find(params[:id])
    @cruise.destroy

    redirect_to cruises_url
  end

  private

  def sort_column
    %w[name status last_price ship].include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
