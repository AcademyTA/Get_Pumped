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
    fill_in "Activity date",  with: "2016-07-26"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")
    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@jason, exercise))
  end

  scenario "with invalid inputs" do
    visit "/"

    click_link "My Dashboard"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: ""
    fill_in "Workout details",  with: ""
    fill_in "Activity date",  with: ""
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout details can't be blank")
    expect(page).to have_content("Activity date can't be blank")
  end
end
