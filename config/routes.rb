Rails.application.routes.draw do
  get "products_url" => "products#products_method"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
end
