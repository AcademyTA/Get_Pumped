require "rails_helper"

RSpec.feature "Sending message" do
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

    @joe = User.create!(
      email: "joe@test.com",
      first_name: "Joe",
      last_name: "Seth",
      password: "password"
    )

    @room_name = 'jason-bourne'
    @room = Room.create(name: @room_name, user_id: @jason.id)

    login_as(@jason)

    Friendship.create(user: @amanda, friend: @jason)
    Friendship.create(user: @joe, friend: @jason)
  end

  scenario "to followers shows in chatroom window" do
    visit "/"
    click_link "My Locker Room"

    expect(page).to have_content(@room_name)

    fill_in "message-field", with: "Hello"
    click_button "Post"

    expect(page).to have_content("Hello")

    within("#followers") do
      expect(page).to have_link(@amanda.full_name)
      expect(page).to have_link(@joe.full_name)
    end
  end
end
