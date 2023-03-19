class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @investors = Investor.all
    @founder = current_user.founder
  end
end
