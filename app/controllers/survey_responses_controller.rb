class SurveyResponsesController < ApplicationController
  before_action :set_survey_response, only: [:show, :edit, :update, :destroy]

  SURVEY_QUESTIONS = [
    { short: "Age",
      long: "How old are you?",
      choices: [
        "18 and under",
        "19",
        "20",
        "21",
        "22+"
      ]
    },
    { short: "Class",
      long: "What is your Caltech graduation class?",
      choices: [
        "2019",
        "2020",
        "2021",
        "2022"
      ]
    },
    { short: "Math",
      long: "What's 5 + 3?",
      choices: [
        "2",
        "4",
        "6",
        "8",
        "10"
      ]
    }
  ]

  # GET /survey_responses
  # GET /survey_responses.json
  def index
    @survey_responses = SurveyResponse.all
  end

  # GET /survey_responses/1
  # GET /survey_responses/1.json
  def show
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.new
  end

  # GET /survey_responses/1/edit
  def edit
  end

  # POST /survey_responses
  # POST /survey_responses.json
  def create
    @survey_response = SurveyResponse.new(survey_response_params)

    respond_to do |format|
      if @survey_response.save
        format.html { render html: "<br> Thanks for submitting a response!".html_safe, layout: "application", layout: true }
        format.json { render :show, status: :created, location: @survey_response }
      else
        format.html { render :new }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_responses/1
  # PATCH/PUT /survey_responses/1.json
  def update
    respond_to do |format|
      if @survey_response.update(survey_response_params)
        format.html { redirect_to @survey_response, notice: 'Survey response was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_response }
      else
        format.html { render :edit }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_responses/1
  # DELETE /survey_responses/1.json
  def destroy
    @survey_response.destroy
    respond_to do |format|
      format.html { redirect_to survey_responses_url, notice: 'Survey response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response
      @survey_response = SurveyResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_response_params
      params.require(:survey_response).permit(:question1, :question2, :question3, :name,
        :raw_question1, :raw_question2, :raw_question3)
    end
end
