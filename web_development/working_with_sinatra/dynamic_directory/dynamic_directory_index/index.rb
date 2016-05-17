require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @public_files = Dir.glob("public/*").map { |file| File.basename(file)}.sort
  @public_files.reverse! if params[:sort] == "desc"
   erb :home
end


