class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  # scope :public_rooms, -> { where(private: false) }
  
end
