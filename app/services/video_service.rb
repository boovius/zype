class VideoService
  class << self
    def get_videos
      response = VideosResponse.new Faraday.get url, params
      response.data
    end

    private

    def url
      'https://api.zype.com/videos'
    end

    def params
      {
        app_key: ENV['ZYPE_API_KEY'],
        sort: 'published_at',
        order: 'desc',
      }
    end
  end
end
