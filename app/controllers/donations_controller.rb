class DonationsController < ApplicationController
  def create
    @feature = Feature.find(:feature_id)
    @feature.donations << Donation.new(30.0)

    respond_to do |format|
      if @feature.save
        format.json { render json: @donation, status: :created, location: @donation }
      else
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end
end
