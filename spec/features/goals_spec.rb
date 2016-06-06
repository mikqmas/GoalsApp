require 'spec_helper'
require 'rails_helper'

feature "goal tracking" do


    it "shows all goals when logged in" do
      FactoryGirl.create(:dougdo)
      visit "/session/new"
      user_sign_in("dougdo", "abcdef")
      make_goal("Get it together")
      visit goals_url
      expect(page).to have_content("Get it together")


    end

    it "shows completed vs incomplete goals" do
      FactoryGirl.create(:dougdo)
      visit "/session/new"
      user_sign_in("dougdo", "abcdef")
      make_goal("Get it together")
      expect(page).to have_content("In Progress")



    end

end
