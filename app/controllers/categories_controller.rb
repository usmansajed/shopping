class CategoriesController < ApplicationController
  before_action :is_admin, only: [:new, :edit, :update, :destroy]

  def index 	
  	@categories=Category.all
  end
  def new 
  		@category=Category.new
  		@category.products.build
  end
  def create

	@category=Category.new(category_params)
	 	respond_to do |format|
			if @category.save
	 			format.html { redirect_to categories_path, :notice => 'New category has been created' }
			else
				format.html { redirect_to new_category_path, :notice => 'Please fill up all input Fields'}
			end
		end
  end
def destroy
	@category=Category.find(params[:id])
	@category.destroy
    redirect_to categories_path
end

def show
	@category=Category.find(params[:id])
	@order_item = current_order.order_items.new
end
def edit
	@category=Category.find(params[:id])
end
def update
	@category=Category.find(params[:id])
	if @category.update_attributes(category_params)
		redirect_to categories_path
	else 
		render "form_for_edit"
	end
end

end




private
	def category_params
    	params.require(:category).permit(:name, products_attributes: [:id, :name, :price, :description, :image, :_destroy])
  	end
