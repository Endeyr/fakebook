Rails.application.routes.draw do
  get 'static_pages/home'
  root "static_pages#home"
  get '*path' => redirect('/')
end
