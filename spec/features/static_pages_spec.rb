require 'rails_helper'

feature "Static pages", :type => :feature do

  feature "Home page", :type => :feature  do

    scenario "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    scenario "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',:text => "Home")
    end
  end

  feature "Help page", :type => :feature do

    scenario "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    scenario "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',:text => "Help")
    end
  end

  feature "About page", :type => :feature do

    scenario "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    scenario "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',:text => "About Us")
    end
  end
end
