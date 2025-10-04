class PhotosController < ApplicationController
  def index
    @photos = Photo.published.with_attached_image.order(created_at: :desc)
  end
end
