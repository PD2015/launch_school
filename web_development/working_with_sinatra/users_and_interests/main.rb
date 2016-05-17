require "sinatra"
require "sinatra/reloader"
require 'YAML'

before do
  @users = YAML.load_file("users.yaml")
end

helpers do


  def count_users
    @users.count
  end

  def count_interests
    @users.map {|user| user[1][:interests].length.to_i}.inject(:+)
  end
end

get '/' do
  redirect '/users'
end

get '/users' do
  
  erb :users
end

get '/users/:name' do
  user_name = params[:name].to_sym
 
  @user = @users[user_name]
  erb :user
end


# Update the message printed out in #5 to 
# determine the number of users and interests 
# based on the content of the YAML file. 
# Use a helper method, count_interests, 
# to determine the total number of interests 
# across all users.