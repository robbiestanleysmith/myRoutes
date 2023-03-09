class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    @route = Route.find(params[:id])
    @destination = Destination.new
    @markers = @route.destinations.geocoded.map do |destination|
      {
        lat: destination.latitude,
        lng: destination.longitude
      }
    end
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    @route.user = current_user
    if @route.save
      redirect_to edit_route_path(@route)
    else
      render :new
    end
  end

  def edit
    @route = Route.find(params[:id])
    @destination = Destination.new
    @markers = @route.destinations.geocoded.map do |destination|
      {
        lat: destination.latitude,
        lng: destination.longitude
      }
    end
  end

  def update
    @route = Route.find(params[:id])
    @route.update(route_params)
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:title)
  end
end
