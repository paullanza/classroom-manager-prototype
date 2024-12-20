json.extract! submission, :id, :student_id, :worksheet_id, :answers, :grades, :created_at, :updated_at
json.url submission_url(submission, format: :json)
