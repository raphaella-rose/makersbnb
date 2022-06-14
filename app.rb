require 'sinatra/base'
require 'sinatra/reloader'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/users/new' do
   
   erb :"users/new"
  end

  post '/users'

  run! if app_file == $0
end