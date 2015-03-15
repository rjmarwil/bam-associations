require "rails_helper"

describe Doctor do
  describe "associations" do
    describe "#appointments" do
      it "returns all associated appointments" do
        doctor = create_doctor
        appointment = Appointment.create!(user_id: create_user.id, doctor_id: doctor.id)

        expect(doctor.appointments).to eq [appointment]
      end
    end

    describe "#users" do
      it "return all users with associated appointments" do
        doctor = create_doctor
        user = create_user
        appointment = Appointment.create!(user_id: user.id, doctor_id: doctor.id)

        expect(doctor.users).to eq [user]
      end
    end
  end
end
