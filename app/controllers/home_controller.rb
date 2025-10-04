class HomeController < ApplicationController
  def index
  @featured_page   = Page.published.find_by(slug: "biography")
    @upcoming_events = Event.published.where("event_date >= ?", Date.today).order(:event_date).limit(5)
    @quotes          = Quote.published.order(created_at: :desc).limit(5)
    @photos          = Photo.published.includes(image_attachment: :blob).limit(6)

  end
end
