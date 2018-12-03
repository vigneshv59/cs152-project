json.extract! survey_response, :id, :question1, :question2, :question3, :name, :created_at, :updated_at
json.url survey_response_url(survey_response, format: :json)
