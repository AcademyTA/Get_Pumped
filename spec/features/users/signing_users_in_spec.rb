require "rails_helper"

RSpec.feature "Users signin" do
  before do
    @jason = User.create!(
      email: "jason@test.com",
      first_name: "Jason",
      last_name: "Bourne",
      password: "password"
    )
  end

  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"

    fill_in "Email", with: @jason.email
    fill_in "Password",  with: @jason.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@jason.email}")
  end
end
