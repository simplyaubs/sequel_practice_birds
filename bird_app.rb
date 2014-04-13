require 'sinatra/base'

class BirdApp < Sinatra::Application

  get '/' do
    birds_table = DB[:birds]
    erb :index, locals: {birdies: birds_table.to_a}
  end

  post '/' do
    birds_table = DB[:birds]
    birds_table.insert(name: params[:bird], color: params[:color])
    redirect '/'
  end

end