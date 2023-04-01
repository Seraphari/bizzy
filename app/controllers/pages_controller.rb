class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pagy, @investors = pagy(Investor.all)
    @founders = Founder.all
    @pagy, @sectors = pagy(Sector.all)
  end
end
