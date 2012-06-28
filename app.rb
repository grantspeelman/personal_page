require "bundler/setup"
require 'sinatra'

get '/' do
  erb :home
end

get '/contact_me' do
  erb :contact
end
get '/contact' do
  erb :contact
end
