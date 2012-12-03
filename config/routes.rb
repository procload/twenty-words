TwentyWords::Application.routes.draw do
  
  resources :lists

  resources :words

  ###---------------------------------------------------- Static Routes
  get '*action', to: 'application'
  root to: 'application#index'
end
