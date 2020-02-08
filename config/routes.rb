Rails.application.routes.draw do
  get 'projects/new', to: 'projects#new', as: 'new'

  post 'projects', to: 'projects#create'

  get 'projects/:id/edit', to: 'projects#edit', as: 'edit'

  patch 'projects/:id', to: 'projects#update', as: 'project'

  delete 'projects/:id', to: 'projects#destroy', as: 'delete'

  get 'projects/dashboard', to: 'projects#dashboard', as: 'dashboard'

  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
