class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :read_first, presence: true
  validates :read_last, presence: true
  validates :birth_day, presence: true

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/, message: 'は英字と数字の両方を含めてください' }

end
