class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index

  def index
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
      @filter_investors = recommendations.uniq
    end

    @filter_investors
    if params[:sector].present?
      @investors = @filter_investors.where(sector: params[:sector])
    end

    if params[:stage].present?
      @investors = @filter_investors.where(stage: params[:stage])
    end

    if params[:query].present?
      # sql_query = "company_name @@ :query OR company_description @@ :query"
      # @investors = Investor.where(sql_query, query: "%#{params[:query]}%")
      @investors = Investor.search_by_company_name_and_company_description(params[:query])
    else
      @investors = Investor.all
    end
  end

  def all
    @investors = Investor.all
  end

  def show

  end

  def toggle_favorite
    @investor = Investor.find(params[:id])
    current_user.favorited?(@investor) ? current_user.unfavorite(@investor) : current_user.favorite(@investor)
  end

  def edit

  end

  def update
    if @investor.update(investor_params)
      redirect_to investor_path(@investor)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private


  def set_investor
    @investor = Investor.find(params[:id])
  end

  def investor_params
    params.require(:investor).permit(:first_name, :last_name, :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :ticket_size, sector_ids: [] )
  end
end
