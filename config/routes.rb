Choseiyan::Application.routes.draw do
  root to: 'top#index'
  resources :top do
  end
end
