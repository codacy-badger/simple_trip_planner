class Trips::ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip
  before_action :set_activity, only: %i[edit update destroy]

  def new
    @activity = Activity.new
  end

  def create
    @activity = @trip.activities.build(activity_params)

    if @activity.save
      flash[:success] = 'Activity was successfully created'
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @activity.update(activity_params)
      flash[:success] = 'Activity was successfully updated'
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def destroy
    @activity.destroy

    flash[:success] = 'Activity was successfully deleted'
    redirect_to trip_path(@trip)
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end

  def set_activity
    @activity = @trip.activities.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:description, :start_at, :end_at, :notes,
                                     :price, :category, :location)
  end
end
