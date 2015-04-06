class AppointmentsController < ApplicationController
  def index
    @doctor = Doctor.all
    @appointment = Appointment.all
  end

  def new
    @user = User.find(params[:user_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    @doctor = @appointment.doctor

    if @appointment.save
      redirect_to appointments_path, notice: "Appointment Created with #{@doctor.name}"
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @doctor = @appointment.doctor

    if @appointment.update(appointent_params)
      redirect_to appointments_path, notice: "Appointment Updated with #{@doctor.name}"
    else
      render :edit
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date, :user_id)
  end
end
