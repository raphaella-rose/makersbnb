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

  run! if app_file == $0
end