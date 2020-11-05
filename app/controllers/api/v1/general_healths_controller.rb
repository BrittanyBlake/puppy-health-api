class Api::V1::GeneralHealthsController < ApplicationController
     before_action :set_general_health, only: [:show, :update, :destroy]

    #GET /general_healths
    def index
        @general_healths = GeneralHealth.all
        json_response(@general_healths)
    end

     # POST /general_healths
  def create
    @general_health = GeneralHealth.create!(general_health_params)
    json_response(@general_health, :created)
  end

  # GET /general_healths/:id
  def show
    json_response(@general_health)
  end

  # PUT /general_healths/:id
  def update
    @general_health.update(general_health_params)
    head :no_content
  end

  # DELETE /general_healths/:id
  def destroy
    @general_health.destroy
    head :no_content
  end

  private

  def general_health_params
    # whitelist params
    params.permit(:weight, :hunger_level, :energy_level, :date)
  end

  def set_general_health
    @general_health = GeneralHealth.find(params[:id])
  end
end
