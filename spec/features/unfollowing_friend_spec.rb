require "rails_helper"

RSpec.feature "Unfollowing Friend" do
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

    login_as(@jason)

    @following = Friendship.create(user: @jason, friend: @amanda)
  end

  scenario do
    visit "/"
    click_link "My Locker Room"

    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@amanda.full_name + " unfollowed")
  end
end
