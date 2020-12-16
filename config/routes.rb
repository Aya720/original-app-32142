Rails.application.routes.draw do
  root to: "folders#index"
  resources :folders, only: [:new , :create , :index]
  resources :folders do
    resources :records
  end
end
