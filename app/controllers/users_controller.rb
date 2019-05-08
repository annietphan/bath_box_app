class UsersController < ApplicationController

  get '/login' do
    if logged_in?(session)
      redirect '/myaccount'
    end
    erb :'users/login'
  end

  post '/login' do
    if User.find_by(username: params[:username])
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/myaccount'
      end
      flash[:message] = "Password is incorrect. Try again!"
      redirect '/login'
    else
      flash[:message] = "Can't find username - please sign up."
      redirect '/signup'
    end
  end

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    users = User.all
    if users.all?{|u| u.email != params[:email]}
      if !params.has_value?("")
        user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = user.id
        flash[:message] = "Account successfully created!"
        redirect '/myaccount'
      else
        flash[:message] = "Please fill out all fields."
        redirect '/signup'
      end
    else
      flash[:message] = "You've already signed up with this email. Please login."
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?(session)
      session.clear
    end
    redirect '/'
  end

  get '/myaccount' do
    @user = User.find_by_id(session[:user_id])
    erb :'users/show'
  end

end
