require "rails_helper"

RSpec.feature "Searching for User" do
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
      last_name: "Bourne",
      password: "password"
    )
  end

  scenario "with existing name returns all those users" do
    visit "/"

    fill_in "search_name", with: "Bourne"
    click_button "Search"

    expect(page).to have_content(@jason.full_name)
    expect(page).to have_content(@amanda.full_name)
    expect(current_path).to eq("/dashboards/search")
  end
end
