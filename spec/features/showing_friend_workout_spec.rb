require "rails_helper"

RSpec.feature "Showing Friend Workout" do
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

    @e1 = @jason.exercises.create(
      duration_in_min: 20,
      workout: "My body building activity",
      workout_date: Date.today
    )

    @e2 = @amanda.exercises.create(
      duration_in_min: 55,
      workout: "Weight lifting",
      workout_date: Date.today
    )

    login_as(@jason)

    @following = Friendship.create(user: @jason, friend: @amanda)
  end

  scenario "shows friend's workout for last 7 days" do
    visit "/"

    click_link "My Locker Room"
    click_link @amanda.full_name

    expect(page).to have_content(@amanda.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end
end
