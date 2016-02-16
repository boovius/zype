class VideosController < ApplicationController
  def index
    @videos = VideoService.get_videos
  end

  def show
    @zype_id = params['zype_id']
  end

  private

  def boolean_string(string)
    ActiveRecord::Type::Boolean.new.type_cast_from_user(string)
  end
end
