json.extract! question, :id, :content, :question_type, :choices, :answer, :rubric, :worksheet_id, :created_at, :updated_at
json.url question_url(question, format: :json)
