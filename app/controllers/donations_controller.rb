class DonationsController < ApplicationController
  before_filter :authenticate!, only: :create

  def new
    app = App.find params[:app_id]
    feature = Feature.new(app: app)
    @donation = Donation.new(feature: feature, user: current_user)
  end

  def create
    @feature = Feature.find(params[:feature_id])
    @donation = Donation.new(params[:donation])
    @feature.receive @donation

    respond_to do |format|
      if @donation.save && @feature.save
        NotificationsMailer.delay.donated(@donation.id, current_user.id)
        format.html { redirect_to app_feature_path(@feature.app, @feature), notice: "Donation offered!" }
        format.json { head :no_content }
      else
        format.html { render action: 'new', controller: 'donations' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end
end
