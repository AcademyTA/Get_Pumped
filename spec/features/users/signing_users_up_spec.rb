require "rails_helper"

RSpec.feature "Users signup" do
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign up"

    fill_in "First name", with: "Billy"
    fill_in "Last name", with: "Cyrus"
    fill_in "Email", with: "brc@example.com"
    fill_in "Password",  with: "password"
    fill_in "Password confirmation",  with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")

    user = User.last
    room = Room.last
    expect(room.name).to eq('billy-cyrus')

    visit "/"
    expect(page).to have_content("Billy Cyrus")
  end

  scenario "with invalid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: "meh@example.com"
    fill_in "Password",  with: "password"
    fill_in "Password confirmation",  with: "password"
    click_button "Sign up"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end
end
