class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    @appointments = current_user.appointments.order('date DESC')
    json_response(@appointments)
  end

  # POST /appointments
  def create
    @appointment = current_user.appointments.create!(appointment_params)
    json_response(@appointment, :created)
  end

  # GET /appointments/:id
  def show
    json_response(@appointment)
  end

  # PUT /appointments/:id
  def update
    @appointment.update(appointment_params)
    head :no_content
  end

  # DELETE /appointments/:id
  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    # whitelist params
    params.require(:appointment).permit(:appt_type, :location, :date, :time)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
