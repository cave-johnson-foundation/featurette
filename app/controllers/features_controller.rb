class FeaturesController < ApplicationController
  def show
    @feature = Feature.find(params[:id])
  end

  def update
    @feature = Feature.find(params[:id])
    @feature.receive Donation.new(params[:amount])

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @feature, notice: 'Donation received!' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end
end
