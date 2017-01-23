require "rails_helper"

RSpec.feature "Listing Members" do
  before do
    @jason = User.create!(
      email: "jason@test.com",
      first_name: "Jason",
      last_name: "Bourne",
      password: "password"
    )

    @amanda = User.create!(
      email: "amanda@test.com",
      first_name: "Amanda",
      last_name: "Miranda",
      password: "password"
    )
  end

  scenario "shows a list of registered members" do
    visit "/"

    expect(page).to have_content("List of Members")
    expect(page).to have_content(@jason.full_name)
    expect(page).to have_content(@amanda.full_name)
  end
end
