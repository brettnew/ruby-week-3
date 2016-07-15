require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the input stylist path', {:type => :feature}) do
  it('allows the user to add a stylist and then to display that stylist in a list') do
    visit('/stylists')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    expect(page).to have_content('Sarah')
  end
end

describe('the modifying stylists path', {:type => :feature}) do
  it('allows the user to click on stylist and be directed to a page with information about the stylist') do
  end
end
