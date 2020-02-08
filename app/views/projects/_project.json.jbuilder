json.extract! project, :id, :name, :description, :start_date, :end_date, :state, :created_at, :updated_at
json.url project_url(project, format: :json)
