json.extract! campaign, :id, :user_id, :name, :typeof, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)