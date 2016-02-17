class AuthService
  class << self
    def get_access_token(parameters)
      response = connection.post post_url(parameters), nil, headers
      AuthResponse.new response
    end

    private

    def connection
      @connection ||= Faraday.new(base_url)
    end

    def base_url
     'https://login.zype.com/'
    end

    def post_url(parameters)
      connection.build_url(endpoint, body(parameters))
    end

    def endpoint
      'oauth/token'
    end

    def headers
      {'Content-Type' => 'application/json'}
    end

    def body(parameters)
      {
        :client_id     => ENV['ZYPE_CLIENT_ID'],
        :client_secret => ENV['ZYPE_CLIENT_SECRET'],
        :username      => parameters[:username],
        :password      => parameters[:password],
        :grant_type    => 'password',
      }
    end
  end
end
