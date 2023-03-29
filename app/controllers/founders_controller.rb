class FoundersController < ApplicationController
  before_action :set_founder, only: [:show, :edit, :update, :follow, :unfollow, :accept, :decline, :cancel]

  def index
    @founders = Founder.all
  end

  def show
    recommendations = []
    @founder.sectors.each do |sector|
      sector.investors.each do |investor|
        recommendations << investor
      end
      recommendations
    end
    @filter_investors = recommendations.uniq

    founders = Founder.all
    @filter_founders = founders.to_a.keep_if { |founder| founder != current_user.founder}
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
    @founder = Founder.find(params[:id])

    current_user.founder.send_follow_request_to(@founder)
    redirect_to founder_path(@founder)
  end

  def unfollow
    @founder = Founder.find(params[:id])

    @founder.unfollow(current_user.founder) if @founder.mutual_following_with?(current_user.founder)
    current_user.founder.unfollow(@founder)
    redirect_to founder_path(current_user.founder)
  end

  def accept
    @founder = Founder.find(params[:id])

    current_user.founder.accept_follow_request_of(@founder)
    current_user.founder.send_follow_request_to(@founder)

    @founder.accept_follow_request_of(current_user.founder)
    # make_it_a_friend_request
    redirect_to founder_path(@founder)
  end

  def decline
    @founder = Founder.find(params[:id])
    @user = @founder.user
    current_user.founder.decline_follow_request_of(@founder)
    current_user.founder.decline_follow_request_of(@user)
    redirect_to founder_path(current_user.founder)
  end

  def cancel
    @founder = Founder.find(params[:id])
    current_user.founder.remove_follow_request_for(@founder)
    redirect_to founder_path(@founder)
  end

  def toggle_favorite
    @founder = Founder.find(params[:id])
    current_user.favorited?(@founder) ? current_user.unfavorite(@founder) : current_user.favorite(@founder)

    respond_to do |format|
      if toggle_favorite.save
        format.html { redirect_to founder_path(@founder) }
        format.json
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json
      end
    end
  end

  private
  # def make_it_a_friend_request
  #     current_user.send_follow_request_to(@user)
  #     @user.accept_follow_request_of(current_user)
  # end

  # def  make_it_an_unfriend_request
  #   @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
  # end

  def set_founder
    @founder = Founder.find(params[:id])
  end

  def founder_params
    params.require(:founder).permit(:company_name, :company_description, :company_email, :company_UEN, :funding_stage, :date_incorporated, sector_ids: [] )
  end
end
