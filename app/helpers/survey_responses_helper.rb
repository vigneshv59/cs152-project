module SurveyResponsesHelper
  def median(question)
    resp = SurveyResponse.all().collect { |r| r.send("question#{question}") }
    resp.sort

    return "" if resp.length == 0

    l = resp[(resp.length - 1) / 2.0]
    r = resp[(resp.length) / 2.0]

    l_descriptor = SurveyResponsesController::SURVEY_QUESTIONS[question - 1] \
      [:choices][l]
    r_descriptor = SurveyResponsesController::SURVEY_QUESTIONS[question - 1] \
      [:choices][r]

    return l_descriptor if l == r
    return "Between #{l_descriptor} and #{r_descriptor}"
  end

  def histogram(question)
    choices = SurveyResponsesController::SURVEY_QUESTIONS[question - 1][:choices].length
    hist = SurveyResponse.group("question#{question}").count

    a = []

    (0...choices).each do |i|
      a[i] = hist[i] || 0
    end

    return a
  end
end
