class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  belongs_to :user
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products


  SALES_TAX = 0.09
  DISCOUNT_THRESHOLD = 50

  def sale_message
    if price.to_i < DISCOUNT_THRESHOLD
      "Discount Item"
    else
      "On sale"
    end
  end

  def tax
    price.to_i * SALES_TAX
  end

  def total
    price.to_i + tax
  end

  def self.get_discount_threshold
   DISCOUNT_THRESHOLD
  end
  
  def printable_categories
    names = []
    categories.each do |category|
     names << category.name
    end
   names.join(',')
  end
end

