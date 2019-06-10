class CategoriesController < ApplicationController

  get '/categories' do
    if logged_in?
      @categories = current_user.categories.uniq
      erb :'dreams/index'
    else
      redirect '/login'
    end
  end
  
end