Testapp::Application.routes.draw do
  devise_for :users
  resources :users, :controllers => { :sessions => "sessions" }
  resources :works

  get 'blog/post/:id' => 'blog#post#:id'
  get 'blog' => 'blog#index'

  root :to => 'root#index'

end
