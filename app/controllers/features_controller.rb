class FeaturesController < ApplicationController
  before_filter :authenticate!, only: :update
  def new
    app = App.find params[:app_id]
    @feature = Feature.new(app: app, user: current_user)
  end

  def show
    @feature = Feature.find(params[:id])
  end

  def create
    app = App.find params[:app_id]
    @feature = Feature.new(params[:feature])
    respond_to do |format|
      if @feature.save
        format.html { redirect_to app_feature_path(app, @feature), notice: 'Feature suggested!' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    app = App.find params[:app_id]
    @feature = Feature.find(params[:id])
    donation = Donation.new(params[:amount])
    @feature.receive donation
    respond_to do |format|
      if @feature.save
        Notifier.delay.donated(donation.id, current_user.id)
        format.html { redirect_to app_feature_path(app, @feature), notice: 'Donation received!' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end
end
