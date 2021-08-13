class User < ApplicationRecord
  enum status: { active: 1, inactive: 0}
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :status, format: { with: /^[0|1]*$/ , message: "only allows letters",:multiline => true}
end
