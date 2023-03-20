class InvestorsController < ApplicationController
  before_action :set_investor, only: [ :show, :edit, :update]

  def index
    if params[:query].present?
      # sql_query = "company_name @@ :query OR company_description @@ :query"
      # @investors = Investor.where(sql_query, query: "%#{params[:query]}%")
      @investors = Investor.search_by_company_name_and_company_description(params[:query])
    else
      @investors = Investor.all
    end
  end

  def show

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

  def edit

  end

  def update
    if @investor.update(investor_params)
      redirect_to investor_path(@investor)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @listing.destroy
  #   redirect_to investors_path, status: :see_other, alert: "Listing was deleted successfully"
  # end

  private


  def set_investor
    @investor = Investor.find(params[:id])
  end

  def investor_params
    params.require(:investor).permit(:first_name, :last_name, :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :ticket_size, sector_ids: [] )
  end
end
