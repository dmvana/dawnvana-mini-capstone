class CartedproductsController < ApplicationController
  def create
    carted_product = CartedProduct.create(
      user_id: current_user.id
      product_id: params[:product_id]
      quantity: params[:quantity]
      status: "In the cart"
     ) 
    
    redirect_to "/carted-products/index"
  end
end
