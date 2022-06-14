require 'sinatra/base'
require 'sinatra/reloader'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end



#   get '/makersbnb/new' do
#     erb :'makersbnb/new'
#   end

  run! if app_file == $0
end