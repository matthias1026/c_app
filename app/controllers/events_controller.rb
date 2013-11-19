class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end