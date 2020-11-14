class Api::V1::TreatsController < ApplicationController
  before_action :set_treats, only: [:show]

  # GET /foods
  def index
    @treats = current_user.treats.order('date DESC')
    json_response(@treats)
  end

  # POST /foods
  def create
    @treat = current_user.treats.create!(treat_params)
    json_response(@treat, :created)
  end

  # GET /foods/:id
  def show
    json_response(@treat)
  end

  # # PUT /foods/:id
  # def update
  #   @treat.update(treat_params)
  #   head :no_content
  # end

  # # DELETE /foods/:id
  # def destroy
  #   @treat.destroy
  #   head :no_content
  # end

  private

  def treat_params
    # whitelist params
    params.permit(:treat_type, :amount, :date)
  end

  def set_treats
    @treat = Treat.find(params[:id])
  end
end
