class VideoService
  class << self
    def get_videos
      VideosResponse.new Faraday.get url, params
    end

    private

    def url
      'https://api.zype.com/videos'
    end

    def params
      { app_key: ENV['ZYPE_API_KEY'] }
    end
  end
end
