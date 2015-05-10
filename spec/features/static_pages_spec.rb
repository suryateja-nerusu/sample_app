require 'rails_helper'

feature "Static pages", :type => :feature do

  feature "Home page", :type => :feature  do

    scenario "should have the h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', :text => 'Sample App')
    end

    scenario "should have the title 'Home'" do
      visit root_path
      page.should have_selector('title',:text => "Home")
    end
  end

  feature "Help page", :type => :feature do

    scenario "should have the h1 'Help'" do
      visit help_path
      page.should have_selector('h1', :text => 'Help')
    end

    scenario "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title',:text => "Help")
    end
  end

  feature "About page", :type => :feature do

    scenario "should have the h1 'About Us'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Us')
    end

    scenario "should have the title 'About Us'" do
      visit about_path
      page.should have_selector('title', :text => "About Us")
    end
  end

  feature "Contact page", :type => :feature do

    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_selector('title', :text => "Contact")
    end
  end
end
