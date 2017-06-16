Rails.application.routes.draw do

  # For wysiwyg editor for blog and projects
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  get 'static/pages'

  # Main Page
  root 'homepage#index'

  # Static pages
  get '/about',      to: 'static#about',       as: 'about'

  # Projects
  get resources :projects

  # Blog
  get resources :posts

  # Devise admin
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login' }
end
