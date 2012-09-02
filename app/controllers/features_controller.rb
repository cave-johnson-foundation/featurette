class FeaturesController < ApplicationController
  before_filter :authenticate!, only: :create

  def new
    app = App.find params[:app_id]
    @feature = Feature.new(app: app, user: current_user)
  end

  def show
    @feature = Feature.find(params[:id])
  end

  def create
    @feature = Feature.new(params[:feature])
    respond_to do |format|
      if @feature.save
        format.html { redirect_to new_app_feature_donation_path(@feature.app, @feature), notice: 'Feature suggested! Now offer some money to it!' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end
end
