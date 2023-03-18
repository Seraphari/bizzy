class Investor < ApplicationRecord
  validates :first_name, :last_name, :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :ticket_size, presence: true
  validates :company_description , length: { maximum: 350,
  too_long: "%{count} characters is the maximum allowed" }
  validates :company_UEN, format: { with: /[1-2]\d\d\d\d\d\d\d\d[A-Za-z]/,
  message: "please follow format here" }
  validates :company_UEN, uniqueness: true
  has_many :investor_sectors
  has_many :sectors, through: :investor_sectors
end
