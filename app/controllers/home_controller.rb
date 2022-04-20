class HomeController < ApplicationController
  def index
    # @albums =x Album.where(publish: true)
    @q = Album.published.ransack(params[:q])
    @albums = @q.result.includes(:tags)
  end
end
