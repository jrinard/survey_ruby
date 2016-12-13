require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


 describe('Survey Routes', {:type => :feature}) do
   describe('Create Survey') do
     it "allows user to create a survey" do
       visit('/surveys')
       fill_in('new-survey-name', :with => "New Survey")
       click_button('Create Survey')
       expect(page).to have_content 'New Survey'
     end
     it "shows an error page if validation fails" do
       visit('/surveys')
       fill_in('new-survey-name', :with => "")
       click_button('Create Survey')
       expect(page).to have_content 'Error'
     end
   end
   describe('show a survey') do
     it "allows user to view individual survey" do
       survey = Survey.create({:name => "Survey"})
       visit("/surveys/#{survey.id}")
       expect(page).to have_content 'Survey'
     end
   end
   describe('add questions to survey') do
     it "allows user to add a question to survey" do
       survey = Survey.create({:name => "Survey"})
       visit("/surveys/#{survey.id}")
       fill_in('new-question-text', :with => "question 1")
       click_button('Add Question')
       expect(page).to have_content 'question 1'
     end
   end


 end
