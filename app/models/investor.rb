class Investor < ApplicationRecord
  acts_as_favoritable

  validates :first_name, :last_name, :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :ticket_size, presence: true
  validates :company_description , length: { maximum: 350,
  too_long: "%{count} characters is the maximum allowed" }
  validates :company_UEN, format: { with: /[1-2]\d\d\d\d\d\d\d\d[A-Za-z]/,
  message: "please follow format here" }
  validates :company_UEN, uniqueness: true

  has_many :investor_sectors, dependent: :destroy
  has_many :sectors, through: :investor_sectors

  include PgSearch::Model
  pg_search_scope :search_by_company_name_and_company_description,
    against: [ :company_name, :company_description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
