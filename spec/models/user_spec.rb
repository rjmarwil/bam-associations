require "rails_helper"

describe User do
  describe "associations" do
    describe "#doctors" do
      it "returns all associated doctors" do
        doctor = create_doctor
        user = create_user
        Appointment.create!(doctor_id: doctor.id, user_id: user.id)

        expect(user.doctors).to eq [doctor]
      end
    end

    describe "#appointments" do
      it "returns all associated appointments" do
        user = create_user
        appointment = Appointment.create!(doctor_id: create_doctor.id, user_id: user.id)

        expect(user.appointments).to eq [appointment]
      end
    end
  end
end
