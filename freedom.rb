require 'sinatra'
require 'yaml/store'

get '/' do
	erb :index
end

post '/cast' do
	@store = YAML::Store.new "messages.yml"
	@name = params['name_area']
	@message = params['message_area']
	@store.transaction do
		@store[@name] ||= @message
	end
	
	# @contents = YAML.load_file("messages.yml")
	erb :cast
end