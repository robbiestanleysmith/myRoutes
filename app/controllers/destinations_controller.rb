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
    @destination = Destination.new(destination_params)
    @destination.user = current_user
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
  end

  private

  def destination_params
    params.require(:destination).permit(:title, :longitude, :latitude)
  end
end
