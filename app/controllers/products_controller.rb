class ProductsController < ApplicationController
	before_action :get_category, only: [:new]
	before_action :get_category_from_product, only: [:create]
	def index 
		@product=Product.all
		@order_item = current_order.order_items.new
	end
	def new
		@product=@category.products.build
	end
	def create
	  	respond_to do |format|
		@product=@category.products.new(product_params)
			if @product.save
				format.html { redirect_to products_path, :notice => 'New product has been created' }
			else
				format.html { redirect_to new_product_path(:id=>@category.id), :notice => 'Fill all fields' }
			end
		end
	end
  	def destroy
  	  @product=Product.find(params[:id])
  	  @product.destroy
  	  redirect_to products_path
  	end
  	def update
  		@product=Product.find(params[:id])
  		if @product.update_attributes(product_params)
  			redirect_to products_path
  		else 
		render "form_for_edit"
		end
  	end
end
private
	def get_category
		@category=Category.find(params[:id])
	end
	def get_category_from_product
		@category=Category.find(params[:product][:category_id])
	end


	def product_params
    	params.require(:product).permit [:id, :name, :price, :description, :image, :_destroy]
  	end
