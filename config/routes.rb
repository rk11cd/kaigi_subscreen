Subscreen::Application.routes.draw do
  resources :notices do
    collection do
      get :sample
    end

    member do
      get :publish
      get :close
    end
  end

  resources :screens

  root :to => "screens#top"
end
