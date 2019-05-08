class ProductsController < ApplicationController

  get '/products' do
  end

  get '/products/:slug' do
    @product = Product.find_by_slug(params[:slug])
    erb :'products/show'
  end
end
