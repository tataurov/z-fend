Testapp::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :users, :controllers => { :sessions => "sessions" }
  resources :works
  resources :posts, :controller => 'blog'
  resources :work_types


  get 'blog/post/:id' => 'blog#show#:id'
  get 'posts/:id' => redirect('/blog/posts/%{id}')


  get 'blog' => 'blog#index'

  root :to => 'root#index'

end
