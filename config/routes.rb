Rails.application.routes.draw do

  #resources 'posts'
  root 'posts#index'

  get    '/posts'  => 'posts#index'
  post  '/posts' =>   'posts#create'

  get    '/posts/new' =>  'posts#new', as: 'new_post'

  get    '/posts/:id'   =>   'posts#show', as: 'post'
  get    '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  patch  '/posts/:id'   =>   'posts#update'
  delete '/posts/:id'   =>   'posts#destroy'
  # put    '/posts/:id'   =>   'posts#update'

end
