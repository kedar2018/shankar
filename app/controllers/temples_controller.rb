class TemplesController < ApplicationController
  def index
    @temples = Temple.published.order(:city, :name)
  end

  def show
    @temple = Temple.published.find_by!(slug: params[:id])
  end
end
