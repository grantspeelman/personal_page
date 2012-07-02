require "bundler/setup"
Bundler.require

get '/' do
  redirect to('/about_me')
end

get '/:page' do
  erb params[:page].to_sym
end
