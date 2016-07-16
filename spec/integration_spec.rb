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

describe('the update a stylist path', {:type => :feature}) do
  it('allows the user to update an existing stylist') do
    visit('/stylists/view')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    click_link('Sarah')
    fill_in('name', :with => 'Mary')
    click_button('Update Name')
    expect(page).to have_content('Success!')
  end
end

describe('the delete stylist path', {:type => :feature}) do
  it('allows the user to delete existing stylist') do
    visit('/stylists/view')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    select('Sarah', :from => 'stylist_id')
    click_button('Delete')
    expect(page).to have_content('There are no stylists')
  end
end

describe('the add a client to stylist path', {:type => :feature}) do
  it('allows the user to assign a client to an existing stylist') do
  visit('/stylists/view')
  fill_in('stylist_name', :with => 'Sarah')
  click_button('Add Stylist')
  click_link('Sarah')
  fill_in('client_name', :with => 'Bob')
  fill_in('phone_number', :with => '555-5555')
  fill_in('email', :with => 'bob@email.com')
  click_button('Add Client')
  expect(page).to have_content('Bob')
  end
end

describe('the view clients path', {:type => :feature}) do
  it('allows the user to visit home page and view clients') do
    visit('/')
    click_link('View All Clients')
    expect(page).to have_content('There are no clients yet')
  end
end

describe('the add clients path', {:type => :feature}) do
  it('allows the user to enter client and view that client') do
    visit('/clients/view')
    visit('/stylists/view')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    click_link('Sarah')
    fill_in('client_name', :with => 'Bob')
    fill_in('phone_number', :with => '555-5555')
    fill_in('email', :with => 'bob@email.com')
    click_button('Add Client')
    expect(page).to have_content('Bob')
  end
end

describe('the delete clients path', {:type => :feature}) do
  it('allows the user to delete client') do
    visit('/clients/view')
    visit('/stylists/view')
    fill_in('stylist_name', :with => 'Sarah')
    click_button('Add Stylist')
    click_link('Sarah')
    fill_in('client_name', :with => 'Bob')
    fill_in('phone_number', :with => '555-5555')
    fill_in('email', :with => 'bob@email.com')
    click_button('Add Client')
    select('Bob', :from => 'client_id')
    click_button('Delete')
    expect(page).to have_content ('There are no clients')
  end
end

describe('the view clients path', {:type => :feature}) do
  it('allows the user to update client information') do
  visit('/stylists/view')
  fill_in('stylist_name', :with => 'Sarah')
  click_button('Add Stylist')
  click_link('Sarah')
  fill_in('client_name', :with => 'Bob')
  fill_in('phone_number', :with => '555-5555')
  fill_in('email', :with => 'bob@email.com')
  click_button('Add Client')
  click_link('Bob')
  expect(page).to have_content('Bob')
  end
end

describe('the update clients path', {:type => :feature}) do
  it('allows the user to update client information') do
  visit('/stylists/view')
  fill_in('stylist_name', :with => 'Sarah')
  click_button('Add Stylist')
  click_link('Sarah')
  fill_in('client_name', :with => 'Bob')
  fill_in('phone_number', :with => '555-5555')
  fill_in('email', :with => 'bob@email.com')
  click_button('Add Client')
  click_link('Bob')
  fill_in('phone', :with => '555-0000')
  fill_in('email', :with => 'bob@hotmail.com')
  click_button('Update Information')
  expect(page).to have_content('555-0000')
  end
end
