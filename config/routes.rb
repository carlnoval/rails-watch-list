Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # - lists-
  # A user can see all the lists                              GET "lists"
  # A user can see the details of a given list and its name   GET "lists/42"
  # A user can create a new list                              GET "lists/new"
  #                                                           POST "lists"

  root to: "lists#index"
  # this command also creates the erb files 
  # rails g controller lists index show new creates: empty method actions, erb files
  resources :lists, only: [ :index, :show, :new, :create ] do
    # GET "lists/42/bookmarks/new"
    # POST "lists/42/bookmarks"
    resources :bookmarks, only: [ :new, :create ]
  end

  resources :bookmarks, only: [ :destroy ]
end
