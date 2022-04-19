class HomeController < ApplicationController
  def index
    @albums = Album.where(publish: true)
    @q = @albums.ransack(params[:q])
    @albums = @q.result.includes(:tags)
  end
end
