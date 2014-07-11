Napsapi::Application.routes.draw do
  scope 'api' do
    resources :naps
  end

  root "naps#index"
end
