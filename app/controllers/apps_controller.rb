class AppsController < ApplicationController
  def index
    @apps = App.scoped
    @latest_donations = Donation.latest
  end

  def show
    @app = App.find(params[:id])
  end
end
