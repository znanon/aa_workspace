json.extract! tweet, :id, :tweeter_id, :reply_id, :body, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
