class QuotesController < ApplicationController
  def index
    @quotes = Quote.published.order(created_at: :desc)
  end
end
