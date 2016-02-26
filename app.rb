require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

post '/unmarshal' do
  content_type :json
  content = Marshal.restore(params[:content])
  {data: content}
end
