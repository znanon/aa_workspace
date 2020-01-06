class Tweet < ApplicationRecord

    validates :body, presence: true

    belongs_to :parent_tweet,
        foreign_key: :reply_id,
        class_name: :Tweet,
        optional: true

    belongs_to :tweeter,
        foreign_key: :tweeter_id,
        class_name: :User
    
    has_many :sub_tweets,
        foreign_key: :reply_id,
        class_name: :Tweet

end
