class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    # 探してなければCreate。Passは変更されても大丈夫なようにランダム
    find_or_create_by!(email: 'guest@example.com', name: 'ゲスト', unique_code: 'guestlogin') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要!
    end
  end

  has_many :themes, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :unique_code, :email, presence: true
  validates :name, length: { minimum: 2, maximum: 20}
  validates :unique_code, uniqueness: true
  # 5-12文字の半角英数字
  validates :unique_code, format: { with: /\A[a-z0-9]+\z/i,message: "は半角英数字である必要があります"}
  validates :unique_code, length: { minimum: 5, maximum: 12}


  attachment :profile_image
end
