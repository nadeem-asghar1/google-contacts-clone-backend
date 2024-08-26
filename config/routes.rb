Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users
    resources :contacts
    post 'check-email-availability', controller: :users, action: :is_email_available
    post 'authenticate', to: 'authentication#authenticate'
    patch '/move-to-trash/:id', to: 'contacts#move_to_trash'
    patch '/handle-favorites/:id', to: 'contacts#handle_favorites'
    get '/favorite-contacts', to: 'contacts#favorite_contacts'
  end
end
