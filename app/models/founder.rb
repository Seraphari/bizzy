class Founder < ApplicationRecord
  validates :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :date_incorporated, presence: true
  validates :company_UEN, format: { with: /[1-2]\d\d\d\d\d\d\d\d[A-Za-z]/,
  message: "please follow format here" }
  validates :company_description , length: { maximum: 1000,
  too_long: "%{count} characters is the maximum allowed" }
  validates :company_UEN, uniqueness: true
  validates :company_email, :company_UEN, confirmation: true
  belongs_to :user, dependent: :destroy
  has_many :founder_sectors
  has_many :sectors, through: :founder_sectors
end
