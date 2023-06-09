class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index
  # before_action :authenticate_user!, only: :toggle_favorite

  def index

    # if current_user.investor.nil? == false
    #   redirect_to "investors/#{current_user.investor.id}/chatrooms"
    # else

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
      if params[:query].present?
        @investors = Investor.search_by_company_name_and_company_description(params[:query])
        @filter_investors = @investors
      end
    end

    if params[:sector].present?
      sector = Sector.find_by("name ILIKE ?", "%#{params[:sector]}%")
      @sector_investors = @filter_investors.select{ |investor| investor.sectors.include?(sector) }
    end

    if params[:stage].present?
      founder = Founder.find_by("funding_stage ILIKE ?", "%#{params[:stage]}%")
      @stage_investors = @filter_investors.select{ |investor| investor.funding_stage.split(", ").include?(founder.funding_stage) }
    end

    if params[:query].present?
      @investors = Investor.search_by_company_name_and_company_description(params[:query])
    else
      @investors = Investor.all
    end

    # end

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

  def edit

  end

  def update
    if @investor.update(investor_params)
      redirect_to all_path
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
    params.require(:investor).permit(:first_name, :last_name, :company_name, :company_description, :company_email, :company_UEN, :funding_stage, :photo, :ticket_size, sector_ids: [] )
  end
end
