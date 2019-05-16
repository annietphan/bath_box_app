class ProductsController < ApplicationController

  get '/products' do
    if logged_in?(session)
      erb :'products/index'
    else
      flash[:message] = "Please sign up/log in to view this page!"
      redirect '/'
    end
  end

  get '/products/:slug' do
    @product = Product.find_by_slug(params[:slug])
    if logged_in?(session)
      erb :'products/show'
    else
      flash[:message] = "Please sign up/log in to view this page!"
      redirect '/'
    end
  end

end
