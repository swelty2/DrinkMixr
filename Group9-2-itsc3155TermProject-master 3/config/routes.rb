Rails.application.routes.draw do
  get 'welcome/index'
  # get 'drinks/index'
  
  get 'drinks/search', to: 'drinks#search', as: :search
  # get 'drinks/search/results' => 'drinks#results'

  
  resources :drinks, :liquors, :mixers, :drinkliquors, :drinkmixers
  
  root 'welcome#index'
  
  # root :to => 'drinks#index'
  # root :to => 'drinks#search'


end
