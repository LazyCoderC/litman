class User < ApplicationRecord
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
end
