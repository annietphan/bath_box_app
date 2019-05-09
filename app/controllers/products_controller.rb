class ProductsController < ApplicationController

  get '/products' do
    # can see this even if you're not logged in
    erb :'products/index'
  end

  get '/products/new' do
    #have to be logged in to see this page
    erb :'products/new'
  end

  post '/products' do
  end

  get '/products/:slug' do
    #can see this even if not loggd in
    @product = Product.find_by_slug(params[:slug])
    erb :'products/show'
  end

  get '/products/:slug/edit' do
    # can only see this if you're logged in && you're the creator of this product

  end

  patch '/products/:slug' do
    # can only patch if this is your product to edit
  end

  delete '/products/:slug/delete' do
    # can only delete if youre logged in & this is your product to delete
  end

end
