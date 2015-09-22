require 'sinatra/base'
require './data_mapper_setup'


class BookmarkManager < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
