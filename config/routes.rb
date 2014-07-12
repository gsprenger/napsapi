Napsapi::Application.routes.draw do
  scope 'api' do
    resources :naps
  end

  root "application#index"
end
