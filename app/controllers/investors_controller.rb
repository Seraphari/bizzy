class InvestorsController < ApplicationController
  before_action :set_investor, only: [ :show ]

  def index
    @investors = Investor.all
  end

  def show
   @investor = Investor.find(params[:id])
  end

  # def new
  #   @investor= Investor.new
  # end

  # def create
  #   @investor = Investor.new(investor_params)

  #   if @investor.save
  #       redirect_to  investor_path(@investor)
  #   else
  #       render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit

  # end

  # def update
  #   if @investor.update(investor_params)
  #     redirect_to investor_path(@investor)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @listing.destroy
  #   redirect_to investors_path, status: :see_other, alert: "Listing was deleted successfully"
  # end

  private

  def founder_params
    params.require(:investor).permit(:first_name, :last_name, :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :ticket_size, :sector_ids: [] )
  end
end
