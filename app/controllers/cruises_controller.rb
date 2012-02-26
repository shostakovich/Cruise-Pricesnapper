class CruisesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @cruises = Cruise.all(:order => sort_column + " " + sort_direction)
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
    @cruise.first_price = 0
    @cruise.last_price = 0

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
    %w[name last_price].include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
