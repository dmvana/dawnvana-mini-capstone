class Order < ActiveRecord::Base
belongs_to :user
belongs_to :carted_products
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
