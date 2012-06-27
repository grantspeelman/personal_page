require "bundler/setup"
require 'sinatra'

get '/' do
  erb :home
end
