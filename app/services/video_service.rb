class VideoService
  class << self
    def get_videos(page)
      response = VideosResponse.new Faraday.get url, params(page)
      response.data
    end

    private

    def url
      'https://api.zype.com/videos'
    end

    def params(page)
      page = 1 if page.blank?
      {
        app_key: ENV['ZYPE_API_KEY'],
        sort: 'published_at',
        order: 'desc',
        per_page: '20',
        page: page
      }
    end
  end
end
