require "rails_helper"

describe Appointment do
  describe "associations" do
    it "responds to user" do
      expect(Appointment.new).to respond_to(:user)
    end

    it "responds to doctor" do
      expect(Appointment.new).to respond_to(:doctor)
    end
  end
end
