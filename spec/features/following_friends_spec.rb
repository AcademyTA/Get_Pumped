require "rails_helper"

RSpec.feature "Following Friends" do
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
  end

  scenario "if signed in" do
    visit "/"

    expect(page).to have_content(@jason.full_name)
    expect(page).to have_content(@amanda.full_name)

    href = "/friendships?friend_id=#{@jason.id}"
    expect(page).not_to have_link("Follow", href: href)

    link = "a[href='/friendships?friend_id=#{@amanda.id}']"
    find(link).click

    href = "/friendships?friend_id=#{@amanda.id}"
    expect(page).not_to have_link("Follow", href: href)
  end
end
