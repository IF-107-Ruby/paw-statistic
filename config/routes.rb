Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: 'dashboards#show'
  resource :users, only: [:new, :create]
  post 'hooks/:integration_name' => 'webhooks#receive', as: :receive_webhooks
end
