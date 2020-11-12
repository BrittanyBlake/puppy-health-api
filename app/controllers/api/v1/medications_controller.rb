class Api::V1::MedicationsController < ApplicationController
  before_action :set_medication, only: [:show, :update, :destroy]

  # GET /medications
  def index
    @medications = current_user.medications.order('date DESC')
    json_response(@medications)
  end

  # POST /medications
  def create
    @medication = current_user.medications.create!(medication_params)
    json_response(@medication, :created)
  end

  # GET /medications/:id
  def show
    json_response(@medication)
  end

  # PUT /medications/:id
  def update
    @medication.update(medication_params)
    head :no_content
  end

  # DELETE /medications/:id
  def destroy
    @medication.destroy
    head :no_content
  end

  private

  def medication_params
    # whitelist params
    params.permit(:name, :use, :date, :time, :dosage)
  end

  def set_medication
    @medication = Medication.find(params[:id])
  end
end
