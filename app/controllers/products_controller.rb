class ProductsController < ApplicationController
	def products_method
	@products = Product.all
	render "products.html.erb"
	end
  def new
    render "new.html.erb"
  end
  def create
    recipe = Product.new(
     name: params[:form_name],
     image: params[:form_image],
     price: params[:form_price],
     description: params[:form_description]
    )
    recipe.save
    render "create.html.erb"
    end
  end


