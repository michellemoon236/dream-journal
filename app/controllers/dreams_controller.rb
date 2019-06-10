class DreamsController < ApplicationController
  
  get '/dreams' do
    if logged_in?
      @dreams = current_user.dreams
      erb: 'dreams/index'
    else
      redirect '/login'
    end
  end
  
  
end