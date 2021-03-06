require 'sinatra'
require 'yaml/store'

get '/' do
	erb :index
end

post '/cast' do
	@store = YAML::Store.new "messages.yml"
	@name = params['name_area']
	if @name == "" then @name = "Anonymous" end 
	@message = params['message_area']
	@date = DateTime.now
	@date.strftime("%m/%d/%Y,%I:%M:%L")
	@store.transaction do
		@store[@date] ||= {@name => @message}
	end
	erb :index
end

post '/search' do
	@search_item = params['search_bar']
	@counter = 0
	erb :search
end

post '/return' do
	erb :index
end