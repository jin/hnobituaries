Rails.application.routes.draw do
  root to: "pages#index"
  get "index", to: "pages#index"
  get "top", to: "pages#top"
end
