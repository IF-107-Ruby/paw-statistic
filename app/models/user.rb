class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # validates :login, presence: true
  # validates :login, length: { in: 2..50 }, if: ->(u) { u.login.present? }
  validates :email, length: { in: 8..255 }, format: { with: VALID_EMAIL_REGEX },
                    if: ->(u) { u.email.present? }

  def self.from_omniauth(auth)
    Rails.logger.info(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create(
      first_name: auth.info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20]
    )
  end

  # def self.from_omniauth(auth)
  #   user = User.find_by(login: auth.info.nickname)
  #   if user
  #     user.update(update_data(auth))
  #     user
  #   else
  #     where(provider: auth.provider, uid: auth.uid).first_or_create(
  #       update_data(auth)
  #     )
  #   end
  # end

  # def self.update_data(params)
  #   attrs = { login: params.info.nickname,
  #             provider: params.provider,
  #             uid: params.uid,
  #             email: params.info.email,
  #             avatar_url: params.info.image,
  #             password: Devise.friendly_token[0, 20] }
  #   attrs
  # end
end
