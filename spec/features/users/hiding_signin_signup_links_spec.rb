require "rails_helper"

RSpec.feature "Hiding signin link" do
  before do
    @jason = User.create!(
      email: "jason@test.com",
      first_name: "Jason",
      last_name: "Bourne",
      password: "password"
    )
  end

  scenario "upon successful signin" do
    visit "/"
    click_link "Sign in"

    fill_in "Email", with: @jason.email
    fill_in "Password",  with: @jason.password
    click_button "Log in"

    expect(page).to have_link("Sign out")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end
end
