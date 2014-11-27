Rails.application.routes.draw do
  root to: "pages#top"
  get "recent", to: "pages#recent"
  get "top", to: "pages#top"
end
