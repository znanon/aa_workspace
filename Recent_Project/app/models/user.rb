class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true
    validates :fname, :lname, presence: true

    has_many :tweets,
        foreign_key: :tweeter_id,
        class_name: :Tweet
end
