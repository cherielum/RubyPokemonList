require 'sinatra/base'

class Pokedex < Sinatra::Base
    get '/' do
        'Hello world'
    end
end