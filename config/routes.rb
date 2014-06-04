SuperZapatos::Application.routes.draw do

  root "static_pages#home"
  resources :stores

  resources :articles
  get 'services/stores'
  get 'services/articles'
  get 'services/articles/stores/:id' => 'services#articles_stores'
  #get 'services/' => 'services#unprocessable'
end
