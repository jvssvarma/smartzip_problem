json.extract! respondent, :id, :user_id, :name, :email, :phone_number, :created_at, :updated_at
json.url respondent_url(respondent, format: :json)