class VideosController < ApplicationController
  def index
    @videos = VideoService.get_videos
  end

  def show
    @sub_req = boolean_string(params['sub_req'])

    @access_token = session['access_token']

    if @sub_req && @access_token.empty?
      @sign_in_required = true
      session['zype_id'] = params['zype_id']
    end

    @zype_id = params['zype_id']
  end

  private

  def boolean_string(string)
    ActiveRecord::Type::Boolean.new.type_cast_from_user(string)
  end
end
