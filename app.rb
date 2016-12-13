require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('survey')
require('question')

get('/') do
  erb(:index)
end
