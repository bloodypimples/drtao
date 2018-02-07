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
  get 'tin-tức', to: "news#index", as: "tin-tuc"
  get 'tin-tức/:id', to: "news#show", as: "tin-tuc-show"
  post ':thing_type/:thing_id/comments', to: "comments#create", as: "comments"

  # cart routes
  get 'giỏ-hàng', to: "carts#show", as: "gio-hang"
  post ':thing_type/:thing_id/line_items', to: "line_items#create", as: "line_items"
  delete ':thing_type/:thing_id/line_items', to: "line_items#destroy"
  post 'orders', to: "orders#create"
  get 'orders/:id', to: "orders#show", as: "order"

  get 'search', to: "pages#search"

  # top level route constraints
  get '/:id', to: "super_categories#show", as: 'super-category-short', constraints: SuperCategoryConstraint.new
  get '/:id', to: "products#show", as: 'san-pham-short', constraints: ProductConstraint.new
  get '/:id', to: "services#show", as: 'dich-vu-short', constraints: ServiceConstraint.new
  get '/:id', to: "parts#show", as: 'linh-kien-short', constraints: PartConstraint.new
  get '/:id', to: "news#show", as: 'tin-tuc-short', constraints: NewsConstraint.new
end
