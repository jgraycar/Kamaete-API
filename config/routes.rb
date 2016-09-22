Rails.application.routes.draw do
  resources :stage_layouts
  resources :instruments
  resources :members
  resources :performances

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
end
