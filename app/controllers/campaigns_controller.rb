class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /campaigns
  # GET /campaigns.json
  def index
    @user = current_user
    @campaign_count = Campaign.where(user_id: @user.id).count
    @user_campaigns = @user.campaigns
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @respondents_ids = CampaignRespondent.where(campaign_id: @campaign.id)
    @campaign_respondents = []
    @respondents_ids.each do |res|
      @campaign_respondents << Respondent.find_by(id: res.id)
    end
    @campaign_respondents = @campaign_respondents.compact
  end

  # GET /campaigns/new
  def new
    @user = current_user
    @campaign = current_user.campaigns.build
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @user = current_user
    @campaign = current_user.campaigns.build(campaign_params)
    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @user = current_user
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:user_id, :name, :typeof)
    end
end
