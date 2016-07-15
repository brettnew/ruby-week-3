require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the input stylist path', {:type => :feature}) do
  it('allows the user to add a stylist and then to display that stylist in a list') do
    visit('/')
    click_link('View All Stylists')
    visit('/stylists/view')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    expect(page).to have_content('Sarah')
  end
end
