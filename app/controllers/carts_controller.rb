class CartsController < ApplicationController

	def index
		@checkout_items= current_order.order_items
		OrderMailer.confirmation_email(current_user, "confirmation email").deliver_now
	end

	def show
		@order_items = current_order.order_items
	end
end
