require 'sinatra'
require 'yaml/store'

get '/' do
	erb :index
end