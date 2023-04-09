class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update]
  # before_action :authenticate_user!, only: :toggle_favorite

  def index
    @investors = Investor.all
    @favorite_investors = current_user.favorited_by_type('Investor')

    if params[:query].present?
      # sql_query = "company_name @@ :query OR company_description @@ :query"
      # @investors = Investor.where(sql_query, query: "%#{params[:query]}%")
      @investors = Investor.search_by_company_name_and_company_description(params[:query])
    else
      @investors = Investor.all
    end

    if current_user.nil?
      @investors = Investor.all
    else
      recommendations = []
      current_user.founder.sectors.each do |sector|
        sector.investors.each do |investor|
          recommendations << investor
        end
        recommendations
      end
      @investors = recommendations.uniq
    end
  end

  def all
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

  def toggle_favorite
    @investor = Investor.find(params[:id])
    current_user.favorited?(@investor) ? current_user.unfavorite(@investor) : current_user.favorite(@investor)
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
    @investor = Investor.find(params[:id])
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
    params.require(:investor).permit(:first_name, :last_name, :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :ticket_size, :photo, sector_ids: [] )
  end
end
