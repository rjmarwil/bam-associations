class AppointmentsController < ApplicationController
  def index
  end

  def new
    @user = User.find(params[:user_id])
    @appointment = Appointment.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @user = User.find(params[:user_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.doctor_id = @doctor.id
    @appointment.user_id = @user.id

    if @appointment.save
      redirect_to appointments_path, notice: "Appointment Created with #{@doctor}"
    else
      render :new
    end
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :appointment_date)
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end
end
