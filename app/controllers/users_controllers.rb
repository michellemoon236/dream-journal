class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect '/home'
    else
      erb :'users/signup'
    end
  end
  
  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "*All fields required*"
      redirect "/signup"
    else 
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/home'
    end
  end 
  
  get '/login' do 
    if logged_in?
      redirect '/home' 
    else 
      erb :'users/login'
    end  
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash[:message] = "*Valid email and password required*"
      redirect '/login'
    end
  end
  
  get '/home' do 
    if logged_in?
      erb :'users/home'
    else 
      redirect '/'
    end 
  end
  
  get '/logout' do
    if logged_in?
      session.clear
      flash[:message] = "*You have been logged out*"
      redirect '/'
    else
      redirect '/'
    end
  end
  
end