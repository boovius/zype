class VideosResponse < Reverb::Response
  def on_success
    self.data = []

    body['response'].each do |video_data|
      zype_id      = video_data['_id']
      title        = video_data['title']
      description  = video_data['description']
      published_at = Time.parse(video_data['published_at'])
      sub_req      = video_data['subscription_required']
      thumbnails   = video_data['thumbnails']

      video = Video.new zype_id, title, description, sub_req, published_at, thumbnails
      self.data << video
    end
  end
end
