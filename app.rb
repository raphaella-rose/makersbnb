require 'sinatra/base'
require 'sinatra/reloader'

class Makersbnb < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/makersbnb/index' do
    @email = session[:email]
    "Welcome, #{@email}"
  end

  get '/users/new' do
   erb :"users/new"
  end

  post '/users/welcome' do
   session[:email] = params[:email]
   redirect '/makersbnb/index'
  end

  get '/makersbnb/add' do
    erb :'makersbnb/add'
  end

  post '/details' do 
   session[:property_title] = params[:property_title]
   session[:description] = params[:description]
   session[:price_per_night] = params[:price_per_night]
    redirect '/makersbnb/my_listings'
   end 

  get '/makersbnb/my_listings' do
    @property_title = session[:property_title]
    @description = session[:description]
    @price_per_night = session[:price_per_night]
    erb :'makersbnb/my_listings'
  end

  run! if app_file == $0
end