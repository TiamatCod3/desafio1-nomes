json.extract! student, :id, :name, :register, :phone, :mail, :uffmail, :status, :created_at, :updated_at
json.url student_url(student, format: :json)
