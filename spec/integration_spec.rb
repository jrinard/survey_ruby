require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


 describe('Survey Routes', {:type => :feature}) do
   describe('Create Survey') do
     it "allows you to create a survey" do
       visit('/surveys')
       fill_in('new-survey-name', :with => "New Survey")
       click_button('Create Survey')
       expect(page).to have_content('New Survey')
     end
     it "shows an error page if validation fails" do
       visit('/surveys')
       fill_in('new-survey-name', :with => "")
       click_button('Create Survey')
       expect(page).to have_content('Error')

     end
   end
 end
