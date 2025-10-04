class EventsController < ApplicationController
  def index
    @events = Event.published.order(event_date: :asc)
  end

  def show
    @event = Event.published.find_by!(slug: params[:id])
  end
end
