require('spec_helper')

describe Question do
  describe('#survey') do
    it "tells you which survey it belongs to" do
      test_survey = Survey.create({:name => "survey1"})
      test_question = Question.create({:text => "text", :survey_id => test_survey.id})
      expect(test_question.survey).to eq test_survey
    end
  end

end
