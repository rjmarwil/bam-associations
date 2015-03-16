require "rails_helper"

feature "user appointments" do
  scenario "can be created by selecting a doctor and date" do
    create_doctor(name: "Dr. Vader")
    create_doctor(name: "Dr. Maul")
    create_user(username: "C3p0", password: "Don't blame me. I'm an interpreter")
    user = create_user(username: "R2D2", password: "beep boop bop")

    sign_in(user)

    visit appointments_path

    expect(page).to have_content "Upcoming Appointments for R2D2: 0"
    expect(page).to have_content "Doctors Assigned to R2D2: 0"

    click_on "New Appointment"
    expect(current_path).to eq new_user_appointment_path(user)

    select("Dr. Vader", from: "Doctor")
    fill_in "Date", with: "01/01/2528"

    click_on "Create Appointment"
    expect(current_path).to eq appointments_path

    expect(page).to have_content "Appointment Created with Dr. Vader"
    expect(page).to have_content "Upcoming Appointments for R2D2: 1"
    expect(page).to have_content "Doctors Assigned to R2D2: 1"

    click_on "New Appointment"

    select("Dr. Maul", from: "Doctor")
    fill_in "Date", with: "01/01/2529"

    click_on "Create Appointment"
    expect(current_path).to eq appointments_path

    expect(page).to have_content "Appointment Created with Dr. Maul"
    expect(page).to have_content "Upcoming Appointments for R2D2: 2"
    expect(page).to have_content "Doctors Assigned to R2D2: 2"

    click_on "New Appointment"

    select("Dr. Maul", from: "Doctor")
    fill_in "Date", with: "01/01/2530"

    click_on "Create Appointment"
    expect(current_path).to eq appointments_path

    expect(page).to have_content "Appointment Created with Dr. Maul"
    expect(page).to have_content "Upcoming Appointments for R2D2: 3"
    expect(page).to have_content "Doctors Assigned to R2D2: 2"
  end

  scenario "can be edited" do
    create_doctor(name: "Dr. Vader")
    doctor = create_doctor(name: "Dr. Maul")
    user = create_user(username: "R2D2", password: "beep boop bop")

    Appointment.create!(user_id: user.id, doctor_id: doctor.id)

    sign_in(user)

    visit appointments_path

    expect(page).to have_content "Upcoming Appointments for R2D2: 1"
    expect(page).to have_content "Doctors Assigned to R2D2: 1"

    click_on "Edit"

    expect(page).to have_content "Appointment with Dr. Maul"

    select("Dr. Vader", from: "Doctor")
    fill_in "Date", with: "01/01/2530"

    click_on "Update Appointment"

    expect(page).to have_content "Appointment Updated with Dr. Vader"
    expect(page).to have_content "Upcoming Appointments for R2D2: 1"
    expect(page).to have_content "Doctors Assigned to R2D2: 1"
  end
end
