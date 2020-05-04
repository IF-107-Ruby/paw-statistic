class User < ApplicationRecord
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable, :omniauthable

  validates :first_name, presence: true
  validates :first_name, length: { in: 3..50 },
                         if: ->(c) { c.first_name.present? }
  validates :last_name, length: { in: 3..50 },
                        if: ->(c) { c.last_name.present? }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create(
      first_name: auth.info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20]
    )
  end
end
