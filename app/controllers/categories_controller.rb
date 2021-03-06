class CategoriesController < ApplicationController

  get '/categories' do
    if logged_in?
      @categories = current_user.categories.uniq.sort_by { |category| category.name }
      erb :'categories/index'
    else
      redirect '/login'
    end
  end

  get '/categories/:id' do
    if logged_in?
      @category = Category.find_by_id(params[:id])
      @dreams = @category.dreams.select { |dream| dream.user_id == current_user.id }
      erb :'categories/show'
    else
      redirect '/login'
    end
  end
  
end