class CreateSurveyResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_responses do |t|
      t.integer :question1
      t.integer :question2
      t.integer :question3
      t.string :name

      t.timestamps
    end
  end
end
