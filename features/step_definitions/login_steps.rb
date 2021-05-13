# frozen_string_literal: true

Given "I am not logged in" do
  visit "/"
end

Given("I am logged into an user with the {string} role") do |role|
  @user = create(:user, role: role, username: "Test123")
  login_as @user
  visit "/"
end

# check links
When "I log into an existing user" do
  visit "/"
  @user = create(:user, username: "Joe Bloggs")
  fill_in "Username", with: @user.username
  fill_in "Password", with: ""
  click_button "Log in"
  @user.reload
end

# check links
When "I log in with invalid credentials" do
  visit "/"
  fill_in "Username", with: "Fake username"
  fill_in "Password", with: "Fake password"
  click_button "Log in"
end

# check links
When "I logout" do
  click_link "Log out"
end

Then "I see that I am logged in" do
  expect(page).to have_content("Hello, #{@user.name}!")
end

Then "I see that my login failed" do
  expect(page).to have_content("Invalid Username or password.")
end

Then "I see that I am logged out" do
  expect(page).to have_content("Please log in below")
end
