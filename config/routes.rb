Rails.application.routes.draw do
  get 'todos', to: 'todos#index'
  post 'todos', to: 'todos#create'
  get 'todos/new'
  get 'todos/:id', to: 'todos#show', as: 'show_todo'
  get 'todos/:id/edit', to: 'todos#edit', as: 'edit_todo'
  patch 'todos/:id', to: 'todos#update'
  delete 'todos/:id', to: 'todos#destroy', as: 'destroy_todo'
  get 'listar', to: 'todos#list', as: 'list_todo'
  get 'todos/:id/complete', to: 'todos#complete', as: 'cambiar_estado'

  root 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
