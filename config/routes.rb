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

  resources :dealer_details do
    resources :products do
      resources :reviews
    end
  end

  resources :dealer_details, controller: 'dealer_details', only: [:index]
  resources :products, controller: 'products', only: [:index]
end
