class User < ApplicationRecord
  include GithubMethods
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :projects, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_many :card_moves, dependent: :destroy
  has_many :assignments, dependent: :nullify, inverse_of: 'assignee',
                         class_name: 'Issue', foreign_key: 'assignee_id'

  validates :login, presence: true, length: { in: 2..50 }
  validates :email, length: { in: 8..255 }, format: { with: VALID_EMAIL_REGEX }

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
