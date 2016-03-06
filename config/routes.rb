Choseiyan::Application.routes.draw do
  root to: 'top#index'
  resources :top, param: :individual_url do
    collection do
      post :thanx
    end
  end
end
