Rails.application.routes.draw do
  root to: "folders#index"
  resources :folders
  resources :folders do
    resources :records
  end
end
