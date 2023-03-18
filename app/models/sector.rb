class Sector < ApplicationRecord
  has_many :founder_sectors
  has_many :investor_sectors
  has_many :founders, through: :founder_sectors
  has_many :investors, through: :investor_sectors
end
