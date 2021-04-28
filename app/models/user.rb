class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers:[:facebook, :google_oauth2]

    has_many :photos
    has_many :comments
    has_many :photos, through: :comments

    # def self.create_from_provider_data(provider_data)
    #   where(provider: provider_data.provider, uid: provider.uid).first_or_create do |user|
    #     user.email = provider_data.info.emailuser.password = Devise.friendly_token[0, 20]
    #   end
    # end



    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.uid = auth.uid
      end
    end

end
