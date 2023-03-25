class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @investors = Investor.all
    # @founder = current_user.founder
    @founders = Founder.all
    @sectors = Sector.all
  end
end
