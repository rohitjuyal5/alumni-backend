class User < ApplicationRecord
  validates :email,:password,:name, presence: true
  validates :email, uniqueness: true
  validates :phoneno, numericality: true
  has_many :posts, dependent: :destroy
end
