class AuthResponse < Reverb::Response
  def on_success
    self.data = {
      access_token: body['access_token'],
      expires_at: Time.at(body['created_at'] + body['expires_in'])
    }
  end
end
