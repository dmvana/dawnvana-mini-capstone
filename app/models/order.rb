class Order < ActiveRecord::Base
belongs_to :user
has_many :carted_products
has_many :products, :through :carted_products
end

def product_tax
  product.tax
end

def product_subtotal
  product.price * quantity
end

def 
  
end
end
