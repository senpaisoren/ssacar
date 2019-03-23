json.extract! report, :id, :title, :content, :texttype, :reported, :created_at, :updated_at
json.url report_url(report, format: :json)
