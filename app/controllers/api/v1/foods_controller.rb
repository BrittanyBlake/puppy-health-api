class Api::V1::FoodsController < ApplicationController
    before_action :set_food, only: [:show, :update, :destroy]

    #GET /foods
    def index
        @foods = current_user.foods
        json_response(@foods)
    end

     # POST /foods
  def create
    @food = current_user.foods.create!(food_params)
    json_response(@food, :created)
  end

  # GET /foods/:id
  def show
    json_response(@food)
  end

  # PUT /foods/:id
  def update
    @food.update(food_params)
    head :no_content
  end

  # DELETE /foods/:id
  def destroy
    @food.destroy
    head :no_content
  end

  private

  def food_params
    # whitelist params
    params.permit(:brand, :amount, :date, :time)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
