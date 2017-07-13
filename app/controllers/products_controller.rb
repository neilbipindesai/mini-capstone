class ProductsController < ApplicationController
  def products_method
    @products = Product.all
    render "products.html.erb"
  end

  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.new(
     name: params[:form_name],
     image: params[:form_image],
     price: params[:form_price],
     description: params[:form_description]
     )
    product.save
    flash[:success] = "Recipe successfully created!"
    redirect_to "/products/#{product.id}"
  end
  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def show
    # product_id = params[:id]
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end
  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.image = params[:form_image]
    @product.price = params[:form_price]
    @product.description = params[:form_description]
    @product.save
    flash[:success] = "Recipe successfully updated!"
    redirect_to "/products/#{@product.id}"
  end
      
  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:warning] = "Product successfully destroyed!"
    redirect_to "/products"
    end
end


