Rails.application.routes.draw do
  resources :people
  scope :api do
    scope :v1 do
      resources :people, defaults: {format: :json}
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
