require 'sinatra/base'
require 'sinatra/reloader'
require './lib/properties'
require 'sinatra/flash'
require './lib/user'
require './database_connection_setup'


class Makersbnb < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/makersbnb/index'
  end

  post '/makersbnb/my_listings' do 
    Properties.create(property_title: params[:property_title], description: params[:description], price_per_night: params[:price_per_night])
    redirect '/makersbnb/spaces/index'
   end 
  
  get '/makersbnb/index' do
    erb :"makersbnb/index"
  end

  get '/sessions/new' do
    erb :"makersbnb/login"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
   
    if user 
      session[:user_id] = user.id
      redirect('/makersbnb/spaces/index')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  get '/makersbnb/signout' do
    session.clear
    flash[:notice] = "You have signed out."
    redirect('/makersbnb/index')
  end
  

  get '/makersbnb/spaces/index' do
    @user = User.find(id: session[:user_id])
    @properties = Properties.all
    erb :"spaces/index"
  end

  post '/makersbnb/spaces/index' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/makersbnb/spaces/index'
   end
 

  get '/makersbnb/new_user' do
   erb :"makersbnb/new_user"
  end

  get '/spaces/new' do
    @user = User.find(id: session[:user_id])
    erb :'spaces/new'
  end

  post '/details' do 
   session[:property_title] = params[:property_title]
   session[:description] = params[:description]
   session[:price_per_night] = params[:price_per_night]
   redirect '/makersbnb/spaces/index'
   end

  get '/property/privet-drive' do
    erb :'property/privet-drive'
  end
  
  post '/property/booking-confirmed' do
    redirect 'property/booking-confirmed'
  end
  
  get '/property/booking-confirmed' do
    erb :'property/booking-confirmed'
  end






  run! if app_file == $0
end

