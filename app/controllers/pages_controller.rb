class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pagy, @investors = pagy(Investor.all)
    # @founder = current_user.founder
    @pagy, @sectors = pagy(Sector.all)
  end
end
