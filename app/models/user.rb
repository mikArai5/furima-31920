class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :items
  has_many :oders

  validates :email,           presence: true, uniqueness: true
  validates :password,        presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i}
  validates :nickname,        presence: true
  validates :first_name,      presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,        presence: true

end
