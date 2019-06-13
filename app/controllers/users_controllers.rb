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
      redirect '/login'
    end
  end
  
  get '/home' do 
    erb :'users/home'
  end
  
  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/home'
    end
  end
  
end