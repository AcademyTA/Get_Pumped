require "rails_helper"

RSpec.feature "Signing users out" do
  before do
    @jason = User.create!(
      email: "jason@test.com",
      password: "password"
    )

    visit '/'
    click_link "Sign in"

    fill_in "Email", with: @jason.email
    fill_in "Password",  with: @jason.password
    click_button "Log in"
  end

  scenario do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")
  end
end
