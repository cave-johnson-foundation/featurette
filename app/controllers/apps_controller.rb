class AppsController < ApplicationController

  # customer facing
  def index
    @apps = App.all
  end

  # customer facing
  def show
    @app = App.find(params[:id])
  end

  # developer api
  def edit
    @app = App.find(params[:id])
  end

  # developer api
  def create
    @app = App.new(params[:app])

    respond_to do |format|
      if @app.save
        format.json { render json: @app, status: :created, location: @app }
      else
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # developer api
  def update
    @app = App.find(params[:id])

    respond_to do |format|
      if @app.update_attributes(params[:app])
        format.json { head :no_content }
      else
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # developer api
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
