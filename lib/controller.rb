require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/:id' do
    erb :show, locals: {gossips: Gossip.find(params['id'])}
  end

  get '/gossips/edit/:id/' do
    erb :edit, locals: {gossips: Gossip.find(params['id'])}
  end 

  post '/gossips/edit/:id/' do
    erb :edit, locals: {gossips: Gossip.update(Gossip.all, params['id'])}
  end 

end
