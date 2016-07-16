require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the view stylists path', {:type => :feature}) do
  it('allows the user to visit home page and view stylists') do
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content('There are no stylists yet')
  end
end

describe('the add stylists path', {:type => :feature}) do
  it('allows the user to enter stylist and view that stylist') do
    visit('/stylists/view')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    expect(page).to have_content('Sarah')
  end
end

describe('the view stylists path', {:type => :feature}) do
  it('allows the user to view added stylist') do
    visit('/stylists/view')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    click_link('Sarah')
    expect(page).to have_content ('Update Sarah')
  end

end
