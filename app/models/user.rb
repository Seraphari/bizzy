class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_favoritor

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :founder
  has_one :investor
  has_many :messages
  has_one_attached :photo

  # validates_uniqueness_of :email
  # scope :all_except, ->(user) { where.not(id: user) }
  # after_create_commit { broadcast_append_to "users" }
end
