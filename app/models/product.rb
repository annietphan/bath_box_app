class Product < ActiveRecord::Base
  has_many :box_products
  has_many :boxes, through: :box_products
  has_many :users, through: :boxes

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Product.all.find{|product| product.slug == slug}
  end
end
