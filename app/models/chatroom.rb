class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :investor, optional: true
  # scope :public_rooms, -> { where(private: false) }
end
