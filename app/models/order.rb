class Order < ActiveRecord::Base
belongs_to :user
belongs_to :product
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
