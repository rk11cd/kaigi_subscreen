Subscreen::Application.routes.draw do
  resources :screens

  root :to => "screens#top"
end
