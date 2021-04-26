class User < ApplicationRecord

    has_many :photos
    has_many :comments
    has_many :photos, through: :comments
    has_many :followers_following



    # def whole_name
    #     self.first_name.to_s + " " + self.last_name.to_s
    # end
end
