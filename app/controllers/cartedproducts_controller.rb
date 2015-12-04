class CartedProductsController < ApplicationController
  def index
    if current_user && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      flash[:warning] = "You don't have anything in your cart. Buy some stuff now!!!"
      redirect_to "/"
    end
  end 
  
  def create
    user_id = current_user
    product_id = params[:product_id]
    quantity = params[:quantity]
    CartedProduct.create(
      user_id: current_user.id
      product_id: params[:product_id]
      quantity: params[:quantity]
      status: "carted"
     ) 
    flash[:success]"Your stuff is in your cart!"
    redirect_to "/carted-products/index"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product successfully removed."
    redirect_to "/carted_products"
+  end 
end
