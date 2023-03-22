class FoundersController < ApplicationController
  before_action :set_founder, only: [:show, :edit, :update]

  def index
    @founders = Founder.all
  end

  def show
    @user = @founder.user
    recommendations = []
    @founder.sectors.each do |sector|
      sector.investors.each do |investor|
        recommendations << investor
      end
      recommendations
    end
    @filter_investors = recommendations.uniq

    founders = Founder.all
    @founders = founders.to_a.keep_if { |founder| founder != current_user.founder}
  end

  def new
    @user = current_user
    if @user.founder.nil?
      @founder = Founder.new
    else
      @founder = @user.founder
      render :new
    end
  end

  def create
    @founder = Founder.new(founder_params)
    @founder.user = current_user
    if @founder.save!
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

  def follow
    make_it_a_friend_request
    redirect_to founder_path(@user.founder)
  end

  def unfollow
    make_it_a_unfriend_request
    current_user.unfollow(@user)
    redirect_to founder_path(@user.founder)
  end

  def accept
    @user = @founder.user
    current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to root_path
  end

  def decline
    @user = @founder.user
    current_user.decline_follow_request_of(@user)
    redirect_to root_path
  end

  def cancel
    @user = @founder.user
    current_user.remove_follow_request_for(@user)
    redirect_to root_path
  end

  private

  def make_it_a_friend_request
    @founder = Founder.find(params[:id])
    @user = @founder.user
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(@current_user)
  end

  def make_it_a_unfriend_request
    @founder = Founder.find(params[:id])
    @user = @founder.user
    @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
  end

  def set_founder
    @founder = Founder.find(params[:id])
  end

  def founder_params
    params.require(:founder).permit(:company_name, :company_description, :company_email, :company_UEN, :funding_stage, :date_incorporated, sector_ids: [] )
  end
end
