require('spec_helper')

describe Survey do
  describe '#questions' do
    it 'returns an array of all the questions in the survey' do
      test_survey = Survey.create(:name => "survey1")
      test_q1 = test_survey.questions.new({:text => "Question 1?"})
      test_q2 = test_survey.questions.new({:text => "Question 2?"})
      expect(test_survey.questions).to eq [test_q1, test_q2]
    end
  end
end