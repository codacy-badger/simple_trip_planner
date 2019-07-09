class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = current_user.trips.order(:created_at)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save
      flash[:success] = 'Trip was successfully created'
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @trip_data = nil
    @activities = @trip.activities.order(:start_at)
  end

  def edit; end

  def update
    if @trip.update(trip_params)
      flash[:success] = 'Trip was successfully updated'
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def destroy
    @trip.destroy

    flash[:success] = 'Trip was successfully deleted'
    redirect_to trips_path
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :start_at, :end_at, :notes)
  end
end
