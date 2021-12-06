Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'tops#index'

  resources :posts do
    resources :comments, only: [:create]
    resources :goods, only: %i[index create destroy]
  end

  resources :conversations do
    resources :messages
  end

  resources :event_rooms do
    resources :event_messages
  end

  resources :events do
    resources :participations, only: %i[index create destroy]
  end

  resources :users, only: %i[show]

  resources :relationships, only: %i[create destroy] do
    member do
      get :followed, :follower
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

end
