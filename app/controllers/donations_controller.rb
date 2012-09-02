class DonationsController < ApplicationController
  def create
    @feature = Feature.find(params[:feature_id])
    @feature.receive Donation.new(params[:amount])
    respond_to do |format|
      if @feature.save
        format.html { redirect_to app_feature_path(@feature.app, @feature), notice: 'Donation received!' }
        format.json { head :no_content }
      else
        format.html { render action: 'show', controller: 'features' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end
end
