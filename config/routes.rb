Rails.application.routes.draw do
  # TODO: Remove after migration to Rails 7
  get "healthz" => "health#show"
  get "up" => "health#show"
  # END

  get 'home/index'

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
