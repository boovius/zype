class VideosController < ApplicationController
  def index
    #@videos = VideoService.get_videos
    @videos = []
    3.times do
      @videos << Video.new(
        'id',
        'title',
        'a long description',
        false,
        'a date',
        {}
      )
    end
  end
end
