# frozen_string_literal: true

get '/' do
  logger.info 'Home route called'

  stylesheet :'views/home'
  erb :home
end
