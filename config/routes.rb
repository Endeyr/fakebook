Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }
  get 'static_pages/home'
  get    "/help",   to: "static_pages#help"
  get    "/about",  to: "static_pages#about"
  get    "/contact",to: "static_pages#contact"
  root "static_pages#home"
  get '*path' => redirect('/')
end
