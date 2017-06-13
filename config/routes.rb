Rails.application.routes.draw do

  get 'static/pages'

  # Main Page
  root 'homepage#index'

  # Static pages
  get '/about',      to: 'static#about',       as: 'about'
  get '/projects',   to: 'static#projects',    as: 'projects'
  get '/contact',    to: 'static#contact',     as: 'contact'

  # Devise admin material
  # devise_scope :Admin do
  #   get 'login', to: 'devise/sessions#new'
  # end
  devise_for :Admin
end
