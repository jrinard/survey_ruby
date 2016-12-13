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

get('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey_detail)
end

post('/surveys') do
  @survey = Survey.new({:name => params.fetch('new-survey-name')})
  if @survey.save
    redirect "/surveys"
  else
    erb(:errors)
  end
end

#going back to individual survey page
post('/questions') do
  survey_id = params.fetch('new-question-survey-id').to_i
  @question = Question.create({:text => params.fetch('new-question-text'), :survey_id => survey_id})
  redirect "/surveys/#{survey_id}"
end
