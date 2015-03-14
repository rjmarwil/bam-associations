require "rails_helper"

feature "app users" do
  scenario "can signup with valid credentials" do
    visit root_path

    click_on "Sign Up"

    fill_in "Username", with: "Mr. No Name"
    fill_in "Password", with: "password"

    within("form") do
      click_on "Sign Up"
    end

    expect(page).to have_content "Welcome Mr. No Name"
    expect(page).to have_link "Sign Out"
  end

  scenario "can sign out" do
    sign_in

    click_on "Sign Out"

    expect(page).to have_content "Signed Out"
  end
end
