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

  post '/boxes' do
    #go back and see if this still creates a box without a field filled out
    if params != ""
      box = Box.create(name: params[:box_name], description: params[:box_description], product_ids: params[:products], user_id: session[:user_id])
      flash[:message] = "You've successfully created a new box!"
      redirect "/boxes/#{box.slug}"
    else
      flash[:message] = "Fill out all fields to continue!"
      redirect "/boxes/new"
    end
  end

  get '/boxes/:slug' do
    if logged_in?(session)
      @box = Box.find_by_slug(params[:slug])
      erb :'boxes/show'
    else
      flash[:message] = "Please sign up/log in to view this page!"
      redirect '/'
    end
  end

  get '/boxes/:slug/edit' do
    @box = Box.find_by_slug(params[:slug])

    if logged_in?(session) && @box.user == current_user(session)
      erb :'boxes/edit'
    else
      flash[:message] = "This is not your box to edit!"
      redirect '/myaccount'
    end
  end

  patch '/boxes/:slug' do
    box = Box.find_by_slug(params[:slug])
    if box.user == current_user(session)
      if params[:box_name].empty?
        flash[:message] = "Please include a name!"
        redirect "/boxes/#{box.slug}/edit"
      elsif params[:box_description].empty?
        flash[:message] = "Please include description!"
        redirect "/boxes/#{box.slug}/edit"
      elsif params[:products].nil?
        flash[:message] = "Please select at least one product!"
        redirect "/boxes/#{box.slug}/edit"
      else
        box.update(name: params[:box_name], description: params[:box_description], product_ids: params[:products])
      end
    else
      flash[:message] = "This is not your box to edit!"
      redirect '/myaccount'
    end
  end

end
