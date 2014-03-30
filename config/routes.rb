Testapp::Application.routes.draw do
  devise_for :users
  resources :users, :controllers => { :sessions => "sessions" }
  resources :works
  resources :work_types

  get 'blog/post/:id' => 'blog#post#:id'
  get 'blog' => 'blog#index'

  root :to => 'root#index'

end
