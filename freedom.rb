require 'sinatra'
require 'yaml/store'

get '/' do
	erb :index
end

post '/cast' do
	@store = YAML::Store.new "messages.store"
	@message = params['message_area']
	@name = params['name_area']
	@store.transaction do
		@store["Posts"] ||= {@name => @message}
	end
	erb :cast
end