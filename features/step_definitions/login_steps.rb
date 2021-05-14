# frozen_string_literal: true

Given("I am not logged in") do
  visit "/"
end

#Given("I am logged into an user in the {string} role") do |role|
  #@user = FactoryBot.create(:user, role: role)
  #fill_in("user[password]", with: @user.password)
  #fill_in("user_username", with: @user.username)
  #click_on "Submit"
  #visit "/"
#end

When("I log into an existing user") do
  @user = FactoryBot.create(:user, role: "edit")
  fill_in("user_username", with: @user.username)
  fill_in("user_password", with: @user.password)
  click_on "Log in"
  visit "/"
end

When('I log in with invalid credentials') do
  fill_in("user_username", with: "Bad name")
  fill_in("user_password", with: "Bad pass")
  click_on "Log in"
end

Then("I see that I am logged in") do
  expect(page).to have_content("Log out")
end

Then('I see that I am logged out') do
  expect(page).to have_content("Please log in below")
end

When("I log out") do
  click_on 'Log out'
end
