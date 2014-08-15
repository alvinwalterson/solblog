class LocationsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :get_locations

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new name: location_params[:name]
    if @location.save
      @photo = Photo.new picture: location_params[:photo], title: @location.name
      @photo.location_id = @location.id
      @photo.save

      redirect_to locations_path, notice: "Location is successfully created."
    else
      redirect_to new_location_path, alert: "Failed to create location."
    end
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes name: location_params[:name]
      @photo = @location.photo
      if @photo.nil?
        @photo = Photo.new
        @photo.location_id = @location.id
      end
      @photo.update_attributes picture: location_params[:photo], title: @location.name

      redirect_to locations_path, notice: "Location is successfully updated."
    else
      redirect_to new_location_path, alert: "Failed to update location."
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path, notice: 'Location is successfully destroyed.'
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(:name, :photo)
  end
end
