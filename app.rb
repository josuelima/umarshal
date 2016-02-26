require 'sinatra'
require 'redis'
require 'yaml'
require 'json'
require 'logger'

configure do
  use Rack::CommonLogger, Logger.new(File.new('./logs/log.log', 'a+'))
end

set :port, 9000
set :bind, '0.0.0.0'

$redis = Redis.new YAML.load_file './configs/redis.yml'

get '/unmarshal' do
  content_type :json

  session_data = $redis.get params[:key]
  session_data.nil? ? {}.to_json : Marshal.restore(session_data).to_json
end
