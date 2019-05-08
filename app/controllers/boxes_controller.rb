class BoxesController < ApplicationController

  get '/boxes' do
    erb :'boxes/index'
  end

  get '/boxes/new' do
    if logged_in?(session)
      erb :'boxes/new'
    else
      flash[:message] = "Please sign up/log in create a box!"
      redirect '/'
    end
  end

  post '/boxes' do
    if params[:box_name].empty? || params[:box_description].empty? || params[:products].nil?
      flash[:message] = "Please fill out all fields!"
      redirect "/boxes/new"
    else
      box = Box.create(name: params[:box_name], description: params[:box_description], product_ids: params[:products], user_id: session[:user_id])
      flash[:message] = "You've successfully created a new box!"
      redirect "/boxes/#{box.slug}"
    end
  end

  get '/boxes/:slug' do
      @box = Box.find_by_slug(params[:slug])
      erb :'boxes/show'
  end

  get '/boxes/:slug/edit' do
    @box = Box.find_by_slug(params[:slug])

    if logged_in?(session) && @box.user == current_user(session)
      erb :'boxes/edit'
    else
      flash[:message] = "This is not your box to edit!"
      redirect "/boxes/#{@box.slug}"
    end
  end

  patch '/boxes/:slug' do
    box = Box.find_by_slug(params[:slug])
    if box.user == current_user(session)
      if params[:box_name].empty? || params[:box_description].empty? || params[:products].nil?
        flash[:message] = "Please fill out all fields!"
        redirect "/boxes/#{box.slug}/edit"
      else
        box.update(name: params[:box_name], description: params[:box_description], product_ids: params[:products])
      end
    else
      flash[:message] = "This is not your box to edit!"
      redirect '/myaccount'
    end
  end

  delete '/boxes/:slug/delete' do
    box = Box.find_by_slug(params[:slug])
    if logged_in?(session)
      if box.user == current_user(session)
        box.delete
        flash[:message] = "Box successfully deleted!"
        redirect '/myaccount'
      else
        flash[:message] = "This is not your box to delete!"
        redirect "/boxes/#{box.slug}"
      end
    else
      flash[:message] = "Please log in or sign up to continue!"
      redirect '/'
    end
  end

end
