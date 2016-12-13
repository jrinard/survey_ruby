require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/survey')
require('./lib/question')

get('/') do
  redirect '/surveys'
end

get('/surveys') do
  @surveys = Survey.all
  erb(:survey_list)
end

post('/surveys') do
  @survey = Survey.new({:name => params.fetch('new-survey-name')})
  if @survey.save
    redirect "/surveys"
  else
    erb(:errors)
  end
end
