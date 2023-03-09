class RouteDestinationsController < ApplicationController
  def index
    @route_destinations = RouteDestination.all
    @markers = @route_destinations.geocoded.map do |route_destination|
      {
        lat: route_destination.latitude,
        lng: route_destination.longitude
      }
    end
  end

  def show
    @route_destination = RouteDestination.find(params[:id])
  end

  def new
    @route_destination = RouteDestination.new
  end

  def create
    @route_destination = RouteDestination.new(route_destination_params)
    @route_destination.user = current_user
  end

  def edit
    @route_destination = RouteDestination.find(params[:id])
  end

  def update
    @route_destination = RouteDestination.find(params[:id])
    @route_destination.update(route_destination_params)
  end

  # def destroy
  #   raise
  #   @route_destination = RouteDestination.find(params[:id])
  #   @route_destination.destroy
  # end

  private

  def route_destination_params
    params.require(:route_destination)
  end
end
