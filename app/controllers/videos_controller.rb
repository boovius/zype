class VideosController < ApplicationController
  def index
    session.delete(:zype_id)
    @videos = VideoService.get_videos params[:page]
  end

  def show
    @sub_req = boolean_string(params['sub_req'])

    @access_token = session['access_token']

    if @sub_req && @access_token.blank?
      @display_sign_in = 'visible'
      session['zype_id'] = params['zype_id']
    else
      @display_sign_in = 'hidden'
    end

    @zype_id = params['zype_id']
  end

  private

  def boolean_string(string)
    ActiveRecord::Type::Boolean.new.type_cast_from_user(string)
  end
end
