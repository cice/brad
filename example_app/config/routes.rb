BradSample::Application.routes.draw do
  resources :users
  resources :demos, :only => [:show, :index], :path => ''
end
