class VideosController < ApplicationController
  def index
    #pagination
    params[:page].blank? ? @page = 1 : @page = params[:page].to_i

    session.delete(:zype_id)
    @videos = VideoService.get_videos @page
  end

  def show
    @sub_req = boolean_string(params['sub_req'])

    if @sub_req && invalid_access_token
      @display_sign_in = 'visible'
      session['zype_id'] = params['zype_id']
    else
      @access_token = session['access_token']
      @display_sign_in = 'hidden'
    end

    @zype_id = params['zype_id']
  end

  private

  def boolean_string(string)
    ActiveRecord::Type::Boolean.new.type_cast_from_user(string)
  end

  def invalid_access_token
    session['access_token'].blank? || Time.now - 60 > session['expires_in']
  end
end
