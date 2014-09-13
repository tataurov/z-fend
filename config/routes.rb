Testapp::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :works
  resources :posts, :controller => 'blog'
  resources :work_types


  get 'blog/post/:id' => 'blog#show#:id'
  get 'posts/:id' => redirect('/blog/posts/%{id}')


  get 'blog' => 'blog#index'

  root :to => 'root#index'

end
