class VideosController < ApplicationController
  def index
    @videos = VideoService.get_videos
  end
end
