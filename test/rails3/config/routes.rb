Rails3::Application.routes.draw do
  match '/flash/:type' => 'flash#redirect', via: [:get, :post]
  match '/flash' => 'flash#show'
  match '/flashajax/:type' => 'flash#ajax', via: [:get, :post]
  root to: 'flash#show'
end
