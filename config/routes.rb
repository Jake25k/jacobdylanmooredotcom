Rails.application.routes.draw do

  get 'static/pages'

  # Main Page
  root 'homepage#index'

  # Static pages
  get '/about',      to: 'static#about',       as: 'about'
  get '/projects',   to: 'static#projects',    as: 'projects'
  get '/contact',    to: 'static#contact',     as: 'contact'

  # Devise admin material
  devise_for :Admin, path: 'admin', path_names: { sign_in: 'login' }
end
