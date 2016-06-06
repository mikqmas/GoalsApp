require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  before :each do
    visit '/users/new'
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      user_sign_up("carly")
      expect(page).to have_content "carly"
      expect(current_path).to eq "/goals"
    end

  end

end

feature "logging out" do
  before :each do
    visit '/users/new'
    user_sign_up('dougdo')
    user_log_out
  end

  it "doesn't show username on the homepage after logout" do
    expect(page).to_not have_content("dougdo")
  end

end

feature "logging in" do

before :each do
  FactoryGirl.create(:dougdo)
  # visit '/users/new'
  # user_sign_up('dougdo')
  # user_log_out
  visit "/session/new"
  user_sign_in('dougdo', 'abcdef')
end

  it "shows username on the homepage after login" do
    expect(page).to have_content('dougdo')
  end


end
