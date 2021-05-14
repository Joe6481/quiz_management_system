Given('I am not logged in') do
  visit "/"
end

When('I log into an existing user') do
  @user = FactoryBot.create(:user)

  fill_in("user[username]", with: @user.username)
  fill_in("user[password]", with: @user.password)
  click_on "Submit"
  visit "/"
end

Then('I see that I am logged in') do
  expect(page).to have_content("Signed in successfully.")
end

When('I log in with invalid credentials') do
  fill_in("user[username]", with: "Bad-user")
  fill_in("user[password]", with: "Bad-password")
  click_on "Submit"
end

Then('I see that my login failed') do
  expect(page).to have_content("Invalid Username or password.")
end

Given('I am logged in') do
  @user = FactoryBot.create(:user)
  fill_in("user[username]", with: @user.username)
  fill_in("user[password]", with: @user.password)
  click_on "Submit"
  visit "/"
end

When('I logout') do
  click_on "Log out"
end

Then('I see that I am logged out') do
  expect(page).to have_content("Please log in below")
end















Given("I am logged into a user") do
  @user = create(:user)
  login_as @user
  visit "/"
end

Given(/^I have the ([\w\s]+) tool$/) do |tool|
  tool = create(:tool, key: tool)
  role = @user.personal_roles.first
  RoleTool.create(role: role, tool: tool, access_level: :write)
  visit "/"
end

Given("I have an user") do
  @user = create(:user, ein: "803042689", personal_roles: [create(:role)])
end

Given("I login with my user") do
  login_as @user
  visit "/"
end

Given("I have a compliance marker") do
  @compliance_marker = create :compliance_marker, code: 454
  @user.update(compliance_markers: [@compliance_marker])
  visit "/"
end

Given "there is another user" do
  @other_user = create :user
end

Given "there is another user in the database with the job bundles tool" do
  @job_bundle_tool = Tool.find_by(key: "job_bundles")
  @role = create(:role, key: "job_controller", tools: [@job_bundle_tool])
  @other_user = create(:user, personal_roles: [@role])
end

Given("I am in the {string} role") do |string|
  role = Role.find_or_create_by(key: string)
  @user.personal_roles << role
end

Given("{string} role exists and has the {string} tool") do |key, tool|
  tool = create(:tool, key: tool)
  @role = create(:role, key: key, tools: [tool])
end

Given "I have an user with an API Token" do
  @api_token, digest_token = ApiTokenGenerator.generate
  @role = create :role
  @user = create(:user, personal_roles: [@role], api_token: digest_token)
end

Given "I have an API Token" do
  @api_token, digest_token = ApiTokenGenerator.generate
  @user.update(api_token: digest_token)
end

When "I visit the home page" do
  visit "/"
end

When "I log into an existing user" do
  visit "/"
  @user = create(:user, ein: "803042689")
  fill_in "EIN", with: @user.ein
  fill_in "Password", with: @user.ein
  click_button "Log in"
  @user.reload
end

When "I log into a non-existent user" do
  visit "/"
  fill_in "EIN", with: "803042689"
  fill_in "Password", with: "803042689"
  click_button "Log in"
end

When "I log in with invalid credentials" do
  fill_in "EIN", with: "not_valid"
  fill_in "Password", with: "fail"
  click_button "Log in"
end

When "I log in as a deactivated user" do
  @user = create(:user, ein: "123456789")
  @user.discard
  fill_in "EIN", with: @user.ein
  fill_in "Password", with: @user.ein
  click_button "Log in"
end

When "I logout" do
  find("li.user-menu").click
  click_link "Log out"
end

When("I click on {string}") do |string|
  click_on(string)
end

When("I click on a {string}") do |string|
  click_on(string, match: :first)
end

Then "I see that I am logged in" do
  expect(page).to have_content("Hello #{@user.name}")
end

Then "I see that my login failed" do
  expect(page).to have_content("Invalid EIN or password.")
end

Then "I see that my login failed because my account is deactivated" do
  expect(page).to have_content("Your account is deactivated.")
end

Then "I see that I am logged out" do
  expect(page).to have_content("Signed out successfully.")
end
