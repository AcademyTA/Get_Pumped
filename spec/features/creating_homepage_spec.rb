require "rails_helper"

RSpec.feature "Creating Home Page" do
  scenario do
    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_link('Get Pumped')
    expect(page).to have_content('The Locker Room')
    expect(page).to have_content('Show off your workout')
  end
end
