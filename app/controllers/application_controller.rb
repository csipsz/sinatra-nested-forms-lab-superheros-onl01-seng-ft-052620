require 'sinatra/base'
require_relative '../models/superhero'
require_relative '../models/superteam'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :super_hero
    end 

    post '/team' do
        @superteam = Superteam.new(params[:team]) 
        params[:team][:heroes].each do |hero|
            Superhero.new(hero)
        end 
        @heroes = Superhero.all
        erb :team 
    end 



end
