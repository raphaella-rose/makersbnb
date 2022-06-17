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

  post '/makersbnb/my_listings' do 
    Properties.create(property_title: params[:property_title], description: params[:description], price_per_night: params[:price_per_night])
    redirect '/makersbnb/my_listings'
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
      redirect('/makersbnb/welcome_user')
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
  

  get '/makersbnb/welcome_user' do
    @user = User.find(id: session[:user_id])
    erb :"makersbnb/welcome_user"
  end

  post '/makersbnb/welcome_user' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/makersbnb/welcome_user'
   end
 

  get '/makersbnb/my_listings' do
    @user = User.find(id: session[:user_id])
    @properties = Properties.all
    erb :'makersbnb/my_listings'
  end

  get '/makersbnb/new_user' do
   erb :"makersbnb/new_user"
  end

  get '/makersbnb/add' do
    @user = User.find(id: session[:user_id])
    erb :'makersbnb/add'
  end

  post '/details' do 
   session[:property_title] = params[:property_title]
   session[:description] = params[:description]
   session[:price_per_night] = params[:price_per_night]
   redirect '/makersbnb/my_listings'
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

  get '/spaces/index' do
    erb :'spaces/index'
  end

  post '/makersbnb/add' do 
    redirect 'makersbnb/add'
  end

  post '/spaces/index' do 
    redirect '/spaces/index'
  end



  run! if app_file == $0
end

