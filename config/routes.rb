Subscreen::Application.routes.draw do
  resources :notices

  resources :screens

  root :to => "screens#top"
end
