$LOAD_PATH.unshift File.dirname(__FILE__)

require 'bundler'
Bundler.require
require 'models'


DATABASE_URL = ENV['DATABASE_URL'] || 'postgres://localhost/pokedex'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, DATABASE_URL)
DataMapper.finalize
Pokemon.auto_upgrade!

class Pokedex < Sinatra::Base
    get '/' do
       @pokemons = Pokemon.all
       erb :index
    end

    post '/' do
        Pokemon.create(params)
        redirect '/'
    end

    get '/:id' do
        @pokemon = Pokemon.get(params[:id])
        erb :show
     end
end