Subscreen::Application.routes.draw do
  resources :notices do
    collection do
      get :sample
    end

    member do
      put :publish
      put :close
    end
  end

  resources :screens do
    member do
      put :bind
      put :unbind
    end
  end

  root :to => "screens#top"
end
