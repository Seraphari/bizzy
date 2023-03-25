class PagesController < ApplicationController
  include Pagy::Backend
  skip_before_action :authenticate_user!, only: :home

  def home
    @investors = Investor.all
    # @founder = current_user.founder
    @sectors = Sector.all
  end
end

# @pagy, @records = pagy(Product.some_scope, items: 5)
