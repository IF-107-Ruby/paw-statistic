Rails.application.routes.draw do
  root to: 'dashboards#show'
  post 'hooks/:integration_name' => 'webhooks#receive', as: :receive_webhooks
end
