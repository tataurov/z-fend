Testapp::Application.routes.draw do
  devise_for :users
  resources :users, :controllers => { :sessions => "sessions" }
  resources :works
  resources :work_types


  get 'blog/post/:id' => 'blog#post#:id'
  get 'blog/post_new' => 'blog#post_new'
  get 'blog' => 'blog#index'

  match 'posts' => 'blog#create', via: [:post]
  match 'post' => 'blog#post#:id', via: [:get]
  match '/blog/post/:id' => 'blog#destroy', via: [:delete]

  root :to => 'root#index'

end
