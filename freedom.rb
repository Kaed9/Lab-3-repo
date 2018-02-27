require 'sinatra'
require 'yaml/store'

# class FreedomBoard < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/cast' do
		store = YAML::Store.new "messages.store"
		
		erb :cast
	end
# end