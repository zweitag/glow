Dummy::Application.routes.draw do
  match '/flash/:type' => 'flash#create', via: :post
  match '/flash' => 'flash#show'
  root to: 'flash#show'
end
