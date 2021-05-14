# frozen_string_literal: true

Given("I am logged into an user in the {string} role") do |role|
  @user = FactoryBot.create(:user, role: role)
  fill_in("user_username", with: @user.username)
  fill_in("user[password]", with: @user.password)
  click_on "Submit"
  visit "/"
end

Given("I am logged into an user with the {string} role") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("There are quizzes in the database") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click on {string}") do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see the existing quizzes") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see the questions") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see the answer options") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see the correct answer") do
  pending # Write code here that turns the phrase above into concrete actions
end
