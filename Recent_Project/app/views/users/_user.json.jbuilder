json.extract! user, :id, :fname, :lname, :username, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
