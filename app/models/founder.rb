class Founder < ApplicationRecord
  # acts_as_favoritable

  validates :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :date_incorporated, presence: true
  validates :company_UEN, format: { with: /[1-2]\d\d\d\d\d\d\d\d[A-Z]/,
             message: "please follow format here" }
  validates :company_description , length: { maximum: 1000,
             too_long: "%{count} characters is the maximum allowed" }
  validates :company_UEN, uniqueness: true
  validates :company_email, confirmation: true
  STAGE = ["Seed", "Pre-seed", "Series A", "Series B", "Series C", "Early Stage", "Growth", "Late Stage"]
  validates :funding_stage, inclusion: { in: STAGE }

  belongs_to :user, dependent: :destroy
  has_many :founder_sectors, dependent: :destroy
  has_many :sectors, through: :founder_sectors
  has_one_attached :photo

  followability

  def unfollow(founder)
    followerable_relationships.where(followable_id: founder.id).destroy_all
  end
end
