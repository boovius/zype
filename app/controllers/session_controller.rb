class SessionController < ApplicationController
  def new
  end

  def create
    response = AuthService.get_access_token (token_parameters)
    if response.success?
      session['access_token'] = response.data[:access_token]
      session['expires_in'] = response.data[:expires_in]

      redirect_to "/videos/#{session['zype_id']}/true"
    else
      redirect_to '/login'
    end
    # take params
    # send to zype api
      #if valid
        # get access token
        # store access_token in session
    # else
        # display login error message to user
  end

  private

  def token_parameters
    {
      username: params['username'],
      password: params['password'],
    }
  end
end
