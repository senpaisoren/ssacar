class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :texts
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@shadysideacademy\.org\z/, message: "must be a Shady Side Academy email" }
end