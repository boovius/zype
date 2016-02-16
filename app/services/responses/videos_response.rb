class VideosResponse < Reverb::Response
  def on_success
    self.data = []

    body['response'].each do |video_data|
      zype_id      = video_data['_id']
      title        = video_data['title']
      description  = video_data['description']
      published_at = video_data['published_at']
      sub_req      = video_data['subscription_required']
      thumbnails   = video_data['thumbnails']

      video = Video.new zype_id, title, description, published_at, sub_req, thumbnails
      self.data << video
    end
  end
end
