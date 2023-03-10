require "open-uri"
require "JSON"

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
      address = "#{params[:destination][:address]}".gsub(/\s/, '%20')
      query_text = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{address}.json?access_token=#{ENV['MAPBOX_API_KEY']}"
      api_response = URI.open(query_text).read
      api_json = JSON.parse(api_response)
      @destination = Destination.new(destination_params)
      @destination.longitude = api_json["features"][0]["geometry"]["coordinates"][0]
      @destination.latitude = api_json["features"][0]["geometry"]["coordinates"][1]
      @destination.title = api_json["features"][0]["text"]
      @destination.address = api_json["features"][1]["place_name"]
      @destination.city = api_json["features"][1]["context"][3]["text"]
      raise
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
