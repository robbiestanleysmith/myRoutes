class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def create
    @route = Route.find(params[:route_id])
    dest = Destination.find_by(address: params[:destination][:address])
    if dest
     @destination = dest
    else
      @destination = Destination.new(destination_params)
      @destination.user = current_user
      @destination.save
    end
    RouteDestination.create(route: @route, destination: @destination)
    redirect_to edit_route_path(@route)
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_back(fallback_location: routes_path)
  end

  private

  def destination_params
    params.require(:destination).permit(:title, :longitude, :latitude, :address)
  end
end
