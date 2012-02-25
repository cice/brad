BradSample::Application.routes.draw do
  resources :users
  resources :groups

  resources :demos, :only => [:show, :index]
end
