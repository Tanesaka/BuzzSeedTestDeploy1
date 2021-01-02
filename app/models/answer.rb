class Answer < ApplicationRecord
  validates :content, :user_id, :theme_id, presence: true

  belongs_to :theme
  belongs_to :user
end
