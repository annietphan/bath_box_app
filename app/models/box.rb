class Box < ActiveRecord::Base
  belongs_to :user
  has_many :box_products
  has_many :products, through: :box_products

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Box.all.find {|box| box.slug == slug}
  end
end
