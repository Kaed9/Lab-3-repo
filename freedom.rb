require 'sinatra'
require 'yaml/store'

get '/' do
	erb :index
end

post '/cast' do
	@store = YAML::Store.new "messages.yml"
	@name = params['name_area']
	@message = ""
	if params['message_area'] == " "
		@message << "Anonymous"
	else
		@message << params['message_area']
	end
	@store.transaction do
		@store[@name] ||= @message
	end
	erb :index
end