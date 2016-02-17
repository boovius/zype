Rails.application.routes.draw do
  root 'videos#index'

  get 'videos/:zype_id/:sub_req' => 'videos#show'
  get  'login'  => 'session#new'
  post 'login'  => 'session#create'
  get  'logout' => 'session#destroy'

  get '*path' => redirect('/')
end
