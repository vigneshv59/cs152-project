class AddRawResultsToResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :survey_responses, :raw_question1, :integer
    add_column :survey_responses, :raw_question2, :integer
    add_column :survey_responses, :raw_question3, :integer
  end
end
