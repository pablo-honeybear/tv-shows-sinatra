require "sinatra"
require "sinatra/activerecord"

set :views, File.join(File.dirname(__FILE__), "app/views")
require_relative "app/models/television_show"

get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  @shows = TelevisionShow.all
  erb :index
end

get "/television_shows/new" do
  @show = TelevisionShow.new
  erb :new
end

get "/television_shows/:id" do
  @show = TelevisionShow.find(params[:id])
  erb :show
end

post "/television_shows" do
  @errors = nil
  @show = TelevisionShow.new(params[:television_show])
  if @show.save
    redirect "/television_shows"
  else
    @errors = @show.errors.messages
    erb :new
  end
end
