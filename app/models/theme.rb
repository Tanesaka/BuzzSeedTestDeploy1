class Theme < ApplicationRecord
  belongs_to :user

  # 画像のカラム名に合わせる
  attachment :image

  validates :image, :user_id, presence: true
end
