require 'rails_helper'

feature "User pages", :type => :feature do

  subject { page }

  feature "signup page", :type => :feature do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end
end
