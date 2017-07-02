Rails.application.routes.draw do

  # For wysiwyg editor for blog and projects

  # Route for adding images
  post '/tinymce_assets' =>   'tinymce_assets#create'

  get 'static/pages'

  # Main Page
  root 'homepage#home'

  # Static pages
  get '/about',      to: 'static#about',       as: 'about'

  # Projects
  get resources :projects
  post "/projects/:id", to: 'projects#pinOrUnpinProject', as: 'pin_Or_Unpin_Project'

  # Blog
  get resources :posts

  # Admin routes
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login' }

end
