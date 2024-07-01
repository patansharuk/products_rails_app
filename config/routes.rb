Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :stores do
    get '/products', to: 'stores#store_products', on: :member
    get '/products', to: 'products#index', on: :collection
    get '/products-analytics', to: 'stores#store_analytics', on: :collection
    resources :products do
      resources :reviews
    end
  end

  resources :stores, controller: 'stores', only: [:index]
  resources :products, controller: 'products', only: [:index]

  get '/admin-dashboard', to: 'application#admin_dashboard'
end
