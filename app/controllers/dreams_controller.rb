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
    if params[:dream][:content] == "" || params[:dream][:title] == ""
      redirect '/dreams/new'
    else
      dream = current_user.dreams.create(params["dream"])
      dream.categories << Category.find_or_create_by(name: params[:category][:name1]) if !params[:category][:name1].empty?
      dream.categories << Category.find_or_create_by(name: params[:category][:name2]) if !params[:category][:name2].empty?
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
      @categories = current_user.categories.uniq
      erb :'dreams/edit'
    else
      redirect '/login'
    end
  end
  
  patch '/dreams/:id' do
    @dream = Dream.find_by_id(params[:id])    
    if params[:dream][:content] == "" || params[:dream][:title] == ""
      redirect "/dreams/#{@dream.id}/edit"
    else
      @dream.update(params["dream"])
      @dream.categories << Category.find_or_create_by(name: params["category"]["name1"]) if !params["category"]["name1"].empty?
      @dream.categories << Category.find_or_create_by(name: params["category"]["name2"]) if !params["category"]["name2"].empty?
      redirect "/dreams/#{@dream.id}"
    end
  end
  
  delete '/dreams/:id' do
    @dream = Dream.find_by_id(params[:id])
    @dream.delete
    redirect '/dreams'
  end
end