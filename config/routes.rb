Rails.application.routes.draw do
  root 'videos#index'

  get 'videos/:zype_id/:sub_req' => 'videos#show'
  get  'login' => 'session#new'
  post 'login' => 'session#create'

  get '*path' => redirect('/')
end
