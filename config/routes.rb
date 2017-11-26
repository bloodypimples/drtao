Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'pages#home'
  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  get "signout", to: "sessions#delete"
  get 'sản-phẩm', to: "products#index", as: "san-pham"
  get 'sản-phẩm/:id', to: "products#show", as: "san-pham-show"
  get 'dịch-vụ', to: "services#index", as: "dich-vu"
  get 'dịch-vụ/:id', to: "services#show", as: "dich-vu-show"
  get 'linh-kiện', to: "parts#index", as: "linh-kien"
  get 'linh-kiện/:id', to: "parts#show", as: "linh-kien-show"
  get 'tin-tuc', to: "news#index"
  get 'tin-tuc/:id', to: "news#show", as: "tin-tuc-show"
  post ':thing_type/:thing_id/comments', to: "comments#create", as: "comments"
end
