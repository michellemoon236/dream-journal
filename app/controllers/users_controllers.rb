class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect '/welcome'
    else
      erb :'users/signup'
    end
  end
  
  post '/signup' do
    if params[:username] == "" || params[:email] =="" || params[:password] ==""
      redirect "/signup"
    else 
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/welcome'
    end
  end 
  
  get '/welcome' do 
    
  end
  
end