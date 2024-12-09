require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @public_files = Dir.glob("public/*").map { |file| File.basename(file) }
  @public_files.reverse! if params[:sort] == "desc"
  
  erb :list
end
