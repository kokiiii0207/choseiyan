Choseiyan::Application.routes.draw do
  root to: 'top#index'
  resources :top do
    collection do
      post :thanx
    end
  end
end
