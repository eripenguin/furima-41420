class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  #has_many :buys

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :read_first, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'はカタカナで入力してください' }
  validates :read_last, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'はカタカナで入力してください' }
  validates :birth_day, presence: true

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/, message: 'は英字と数字の両方を含めてください' }

end
