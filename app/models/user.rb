class User < ApplicationRecord
  enum status: { active: 1, inactive: 0 }


  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :status, inclusion: { in: %w(active inactive) }
end
