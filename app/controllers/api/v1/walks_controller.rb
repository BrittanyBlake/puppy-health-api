class Api::V1::WalksController < ApplicationController
  before_action :set_walks, only: [:show, :update, :destroy]

  # GET /foods
  def index
    @walks = current_user.walks
    json_response(@walks)
  end

  # POST /foods
  def create
    @walk = current_user.walks.create!(walk_params)
    json_response(@walk, :created)
  end

  # GET /foods/:id
  def show
    json_response(@walk)
  end

  # PUT /foods/:id
  def update
    @walk.update(walk_params)
    head :no_content
  end

  # DELETE /foods/:id
  def destroy
    @walk.destroy
    head :no_content
  end

  private

  def walk_params
    # whitelist params
    params.permit(:time, :date, :distance)
  end

  def set_walks
    @walk = Walk.find(params[:id])
  end
end
