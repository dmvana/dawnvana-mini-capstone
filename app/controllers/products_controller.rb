class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    end  
    if params[:discount]
      @products = Product.where("price < ?", 50)
    end
    render :index
    if params[:category]
      @products = Category.find_by(name: params[category]).products
    end
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    if sort_attribute && sort_order
      @products = Product.order(sort_attribute => sort_order)
    end
  end


  def show
    if params[:id] == "random"
      product = Product.all
      @product = product.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render :show
  end

  def new 
    render :new
  end

  def create
    @product = Product.create(
      name: params[:input_name], 
      price: params[:input_price],
      image: params[:input_image], 
      description: params[:input_description],
      rating: params[:rating],
      user_id: current_user.id
      )
    flash[:success] = "Product was successfully created!"
    redirect_to '/products#{@taco.id}'
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render :edit
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description]
      )
    flash[:success] = "Product was sucessfully updated!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "Product destroyed!"
    redirect_to "/"
  end

  def search
    search_term = params[:input_search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render :index
  end
end


