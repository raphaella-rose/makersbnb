require 'sinatra/base'
require 'sinatra/reloader'
require './lib/properties'

class Makersbnb < Sinatra::Base #inherits from Sinatra::Base 

  get '/makersbnb/my_listings' do 
    @properties = Properties.all
    erb :'makersbnb/my_listings'
  end

  get '/makersbnb/add' do
    erb :'makersbnb/add'
  end

  post '/makersbnb/my_listings' do 
    Properties.create(property_title: params[:property_title], description: params[:description], price_per_night: params[:price_per_night])
    redirect '/makersbnb/my_listings'
   end 

  run! if app_file == $0
end

#we're not cleaning the test db after each test