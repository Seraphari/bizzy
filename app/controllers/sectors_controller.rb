class SectorsController < ApplicationController
  def index
    @sectors = Sector.all
  end

  def index
    @sector = Sector.find(params[:id])
  end
end
