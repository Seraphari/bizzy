class InvestorSector < ApplicationRecord
  belongs_to :investor
  belongs_to :sector
end
