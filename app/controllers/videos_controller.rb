class VideosController < ApplicationController
  def index
    @videos = VideoService.get_videos
  end

  def show
    @zype_id = params['zype_id']
  end
end
