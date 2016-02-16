Rails.application.routes.draw do
  root 'videos#index'

  get 'videos/:zype_id' => 'videos#show'
end
