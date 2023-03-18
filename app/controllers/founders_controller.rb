class FoundersController < ApplicationController
  before_action :set_founder, only: [:show, :edit, :update]
  before_action :set_user, only: [:new, :create]

  def index
    @founders = Founder.all
  end

  def show
   @founder = Founder.find(params[:id])
  end

  def new
    @founder= Founder.new
  end

  def create
    @founder = Founder.new(founder_params)
    raise
    if @founder.save
        redirect_to  founder_path(@founder) #go to the recommendation page
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @founder.update(founder_params)
      redirect_to founder_path(@founder)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @listing.destroy
  #   redirect_to founders_path, status: :see_other, alert: "Listing was deleted successfully"
  # end

  private

  def set_user
    @user = current_user
  end

  def founder_params
    params.require(:founder).permit(:company_name, :company_description, :company_email, :company_UEN, :funding_stage, :date_incorporated, sector_ids: [] )
  end
end