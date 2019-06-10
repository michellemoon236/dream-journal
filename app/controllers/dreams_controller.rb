class DreamsController < ApplicationController
  
  get '/dreams' do
    if logged_in?
      @dreams = current_user.dreams
      erb :'dreams/index'
    else
      redirect '/login'
    end
  end
  
  get '/dreams/new' do
    if logged_in?
      @categories = current_user.categories.uniq
      #binding.pry
      erb :'dreams/new'
    else 
      redirect '/login'
    end
  end
  
  post '/dreams' do
    if params[:content] == "" || params[:title] == ""
      redirect '/dreams/new'
    else
      dream = current_user.dreams.create(params["dream"])
      dream.categories << Category.create(name: params["category"]["name1"]) if !params["category"]["name1"].empty?
      dream.categories << Category.create(name: params["category"]["name2"]) if !params["category"]["name2"].empty?
      redirect '/dreams'
    end
  end
  
  get '/dreams/:id' do
    if logged_in?
      @dream = Dream.find_by_id(params[:id])
      erb :'dreams/show'
    else
      redirect '/login'
    end
  end
  
  get '/dreams/:id/edit' do
    if logged_in?
      @dream = Dream.find_by_id(params[:id]) 
      erb :'dreams/edit'
    else
      redirect '/login'
    end
  end
  
  patch '/dreams/:id' do
    
  end
  
end