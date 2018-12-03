require 'test_helper'

class SurveyResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_response = survey_responses(:one)
  end

  test "should get index" do
    get survey_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_response_url
    assert_response :success
  end

  test "should create survey_response" do
    assert_difference('SurveyResponse.count') do
      post survey_responses_url, params: { survey_response: { name: @survey_response.name, question1: @survey_response.question1, question2: @survey_response.question2, question3: @survey_response.question3 } }
    end

    assert_redirected_to survey_response_url(SurveyResponse.last)
  end

  test "should show survey_response" do
    get survey_response_url(@survey_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_response_url(@survey_response)
    assert_response :success
  end

  test "should update survey_response" do
    patch survey_response_url(@survey_response), params: { survey_response: { name: @survey_response.name, question1: @survey_response.question1, question2: @survey_response.question2, question3: @survey_response.question3 } }
    assert_redirected_to survey_response_url(@survey_response)
  end

  test "should destroy survey_response" do
    assert_difference('SurveyResponse.count', -1) do
      delete survey_response_url(@survey_response)
    end

    assert_redirected_to survey_responses_url
  end
end
