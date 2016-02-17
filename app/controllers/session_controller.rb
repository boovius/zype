class SessionController < ApplicationController
  def new
  end

  def create
    response = AuthService.get_access_token (token_parameters)

    if response.success?
      session['username'] = params['username']
      session['access_token'] = response.data[:access_token]
      session['expires_in'] = response.data[:expires_in]

      redirect_to "/videos/#{session['zype_id']}/true"
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:username)
    session.delete(:access_token)
    session.delete(:expires_in)
    session.delete(:zype_id)

    redirect_to '/'
  end

  private

  def token_parameters
    {
      username: params['username'],
      password: params['password'],
    }
  end
end
