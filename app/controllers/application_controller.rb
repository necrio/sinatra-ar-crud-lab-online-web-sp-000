
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/Article/new' do
    erb: new 
    
  end
  
  post '/articles' do 
    article = Article.new(params[:article])
    article.save
    redirect '/articles'
  end
  
  get '/articles' do 
    @articles = Article.all 
    erb: index 
  end 
  
  get ‘/articles/:id/edit’ do
@articles = Article.find(params[:id])
erb :edit
end

delete ‘/articles/:id’ do
@article = Article.find(params[:id])
@article.destroy
redirect “/articles”
end

end
