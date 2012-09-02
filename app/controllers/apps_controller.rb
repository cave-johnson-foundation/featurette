class AppsController < ApplicationController
  def index
    @apps = App.scoped
  end

  def show
    @app = App.find(params[:id])
  end
end
