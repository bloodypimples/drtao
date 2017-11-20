Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'pages#home'
  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  get "signout", to: "sessions#delete"
  get 'sản-phẩm', to: "products#index", as: "san-pham"
  get 'san-pham/:id', to: "products#show", as: "san-pham-show"
  get 'dich-vu', to: "services#index"
  get 'dich-vu/:id', to: "services#show", as: "dich-vu-show"
  get 'linh-kien', to: "parts#index"
  get 'linh-kien/:id', to: "parts#show", as: "linh-kien-show"
  get 'tin-tuc', to: "news#index"
  get 'tin-tuc/:id', to: "news#show", as: "tin-tuc-show"
end
