class RoutesController < ApplicationController
  def index
    @routes = Route.all
    # @markers = @routes.geocoded.map do |route|
    # {
    #   lat: route.latitude,
    #   lng: route.longitude
    # }
    # end
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    @route.user = current_user
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    @route.update(route_params)
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
  end

  private

  def route_params
    params.require(:route).permit(:title)
  end
end
