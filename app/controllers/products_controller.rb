class ProductsController < ApplicationController
  def index
  	@category=Category.all
  end
  def new
  		@category=Category.new
  		@category.products.build
  end
  def create
  	
	
	@category=Category.new(category_params)
	if @category.save!
	 redirect_to new_product_path
	else
		render "new"
	end
  end
def destroy
	@category=Category.find(params[:id])
	@category.destroy
    redirect_to products_path
end

def show
	@category=Category.find(params[:id])
end
def edit
@category=Category.find(params[:id])
end
def update
	@category=Category.find(params[:id])
	if @category.update_attributes!(category_params)
		redirect_to product_path
		# :notice=> "Your friends have been updated"
	else 
		render "form_for_edit"
	end
end

end




private
	def category_params
    	params.require(:category).permit(:name, products_attributes: [:id, :name, :price, :description, :image, :_destroy])
  	end
