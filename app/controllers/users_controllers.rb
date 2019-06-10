class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect '/welcome'
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
      redirect '/welcome'
    end
  end 
  
  get '/login' do 
    if logged_in?
      redirect '/welcome' 
    else 
      erb :'users/login'
    end  
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/welcome'
    else
      redirect '/login'
    end
  end
  
  get '/welcome' do 
    erb :'users/welcome'
  end
  
  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/welcome'
    end
  end
  
end