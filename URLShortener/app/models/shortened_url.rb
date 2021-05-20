require 'securerandom'
class ShortenedUrl < ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true

    def self.random_code 
        while true
            code = SecureRandom.urlsafe_base64(6)
            next if ShortenedUrl.exists?(short_url: code)
            return code 
        end   
    end 

    def self.create_url(user, long_url)
        ShortenedUrl.create!({short_url: ShortenedUrl.random_code, long_url: long_url, user_id: user.id})
    end 

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

end