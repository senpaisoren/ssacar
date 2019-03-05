json.extract! recommendation, :id, :title, :content, :texttype, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
