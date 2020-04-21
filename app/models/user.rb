class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id"

    def create_token
        remember_me = Digest::SHA256.hexdigest(SecureRandom.urlsafe_base64.to_s)
        update_attribute('remember_me', remember_me)
        remember_me
    end



end
