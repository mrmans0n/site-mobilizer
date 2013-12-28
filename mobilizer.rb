require 'sinatra'
require 'rest_client'

get '/' do
  'Up and running!'
end

get '/mobilize' do
  content_type :json
  url = params[:url]
  token = ENV['READABILITY_TOKEN']
  RestClient.get "https://readability.com/api/content/v1/parser?token=#{token}&url=#{url}" do |response, request, result|
    if [301, 302, 307].include? response.code
      response.follow_redirection(request, result)
    else 
      status response.code
      response
    end
  end
end
