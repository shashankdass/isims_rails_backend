Rails.application.routes.draw do
  get 'organizations/:org_id/entity/:entity_id/validate_entity_info/:key/:value', to: "organizations#validate_entity_info"
  get 'organizations/:org_id/entity/:entity_id/update_entity_info/:key/:value', to: "organizations#update_entity_info"
  resources :organizations do
    member do
      get 'org_type'
      get 'is_validator'
      get 'is_producer'
      get 'get_readable_fields'
      get 'get_writable_fields'
    end
  end
  resources :entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
