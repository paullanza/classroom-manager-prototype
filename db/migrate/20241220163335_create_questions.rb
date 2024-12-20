class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :question_type
      t.text :choices
      t.text :answer
      t.text :rubric
      t.references :worksheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
