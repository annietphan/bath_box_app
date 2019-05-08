class BoxesController < ApplicationController

  get '/boxes' do
  end

  get '/boxes/new' do
    if logged_in?(session)
      erb :'boxes/new'
    else
      flash[:message] = "Please sign up/log in to view this page!"
      redirect '/'
    end
  end

end
