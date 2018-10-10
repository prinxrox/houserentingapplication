Rails.application.routes.draw do



  resources :houses

  resources :inquiries

  root 'home#index'
  resources :real_estate_companies

  get 'search', action: 'search', controller: 'houses'
  post 'search', action: 'search', controller: 'houses'

  devise_scope :hunter do
    root :to => "hunters/sessions#new"
  end

  devise_for :hunters, controllers: {
      sessions: 'hunters/sessions',
      registrations: 'hunters/registrations'
  }
  resources :hunters, only: [:index]
  get  '/hunterindex',  to: 'hunters#index'
  resources :hunters, path: 'admins/manage/hunters',
            controller: 'admins/manage_hunters',
            as: :hunter




  devise_scope :admin do
    root :to => "admins/sessions#new"
  end

  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations'
  }
  resources :admins, only: [:index]
  get  '/adminindex',  to: 'admins#index'




  devise_scope :realtor do
    root :to => "realtors/sessions#new"
  end

  devise_for :realtors, controllers: {
      sessions: 'realtors/sessions',
      registrations: 'realtors/registrations'
  }
  resources :realtors, only: [:index]
  get  '/realtorindex',  to: 'realtors#index'
  resources :realtors, path: 'admins/manage/realtors',
            controller: 'admins/manage_realtors',
            as: :realtor

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
