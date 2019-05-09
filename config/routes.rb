Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :packs, only: %i[] do
    collection do
      post '/', to: 'packs#packed_measures'
    end
  end
end
