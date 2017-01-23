require "rails_helper"

RSpec.feature "Creating exercise" do
  before do
    @jason = User.create!(
      email: "jason@test.com",
      first_name: "Jason",
      last_name: "Bourne",
      password: "password"
    )
    login_as(@jason)
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "My Dashboard"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout details",  with: "Weight lifting"
    fill_in "Activity date",  with: "2017-01-26"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")
    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@jason, exercise))
  end
end
