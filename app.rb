require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/user'
require './database_connection_setup'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end


  get '/sessions/new' do
    erb :"makersbnb/login"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/makersbnb/index')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end
  

  get '/makersbnb/index' do
    @user = User.find(id: session[:user_id])
    erb :"makersbnb/index"
  end

  get '/users/new' do
   erb :"users/new"
  end

  post '/users/welcome' do
   user = User.create(email: params[:email], password: params[:password])
   session[:user_id] = user.id
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