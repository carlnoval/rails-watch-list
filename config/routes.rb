Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # List

  # A user can see all the lists
  # GET "lists"
  # A user can see the details of a given list and its name
  # GET "lists/42"
  # A user can create a new list
  # GET "lists/new"
  # POST "lists"
  resources :lists, only: [ :index, :show, :new, :create ]
end
