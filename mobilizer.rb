require 'sinatra'
require 'rest_client'

get '/' do
  "This is a mobilizer service. For any questions regarding it, please contact nacho[at]nlopez.io"
end

get '/mobilize' do
  url = params[:url]
  token = ENV['READABILITY_TOKEN']
  puts "token=#{token}"
  response = RestClient.get "https://readability.com/api/content/v1/parser?token=#{token}&url=#{url}"
  response
end