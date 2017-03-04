Rails.application.routes.draw do
  resources :blood_sugar_levels do
    post 'upload', on: :collection
  end

  root to: "blood_sugar_levels#index"
end
