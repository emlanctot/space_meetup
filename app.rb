require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(name: :asc)

  erb :'meetups/index'
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])

  erb :'/meetups/show'
end

get '/new' do

  erb :'/meetups/form'
end

post "/new" do
  name = params["name"]
  description = params["description"]
  location = params["location"]
  date = params["date"]
  time = params["time"]
  picture = params["picture"]

  Meetup.create(name: name, description: description, location: location, date: date, time: time, picture: picture)
  erb :'/meetups/form'
end
