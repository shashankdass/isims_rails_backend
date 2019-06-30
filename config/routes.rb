Rails.application.routes.draw do
  resources :organizations do
    resources :entities do
      member do
        get 'validate_entity_info'
      end
    end
    member do
      get 'org_type'
      get 'is_validator'
      get  'is_producer'
    end
  end
  resources :entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
