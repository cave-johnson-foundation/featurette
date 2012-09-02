class DonationsController < ApplicationController
  def new
    app = App.find params[:app_id]
    feature = Feature.new(app: app)
    @donation = Donation.new(feature: feature, user: current_user)
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def create
    @feature = Feature.find(params[:feature_id])
    @donation = Donation.new(params[:amount])
    @feature.receive @donation

    respond_to do |format|
      if @donation.save && @feature.save
        format.html { redirect_to app_feature_donation_path(@feature.app, @feature, @donation), notice: 'Donation received!' }
        format.json { head :no_content }
      else
        format.html { render action: 'new', controller: 'donations' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end
end
