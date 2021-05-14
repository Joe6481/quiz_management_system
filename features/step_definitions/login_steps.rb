# frozen_string_literal: true

Given("I am not logged in") do
  visit "/"
end

When("I log into an existing user") do
  @user = FactoryBot.create(:user, role: "edit")

  fill_in("user_username", with: @user.username)
  fill_in("user_password", with: @user.password)
  click_on "Log in"
  visit "/"
end

Then("I see that I am logged in") do
  expect(page).to have_content("Log out")
end
