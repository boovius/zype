Rails.application.routes.draw do
  root 'videos#index'

  get 'videos/:id' => 'videos#show'
end
