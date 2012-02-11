class CruisesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if sort_column == "name"
      @cruises = Cruise.all(:include => :prices, :order => "name" + " " + sort_direction)
    else
      @cruises = Cruise.all(:include => :prices, :order => 'prices.price ' + sort_direction)
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

    if @cruise.save
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
    params[:sort]  || "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
