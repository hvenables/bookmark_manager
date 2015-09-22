require 'sinatra/base'
require './data_mapper_setup'


class BookmarkManager < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    # @links = Link.all
    erb :'links/new'
  end

  post '/links/new' do
    Link.first_or_create(params)
    redirect '/links'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
