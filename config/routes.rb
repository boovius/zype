Rails.application.routes.draw do
  root 'videos#index'

  get 'videos/:zype_id/:sub_req' => 'videos#show'
end
