# frozen_string_literal: true

When("I create a new quiz") do
  fill_in("quiz_title", with: "Test Create Title")
  fill_in("quiz_description", with: "Test Create Description")
  fill_in("quiz_questions_attributes_0_content", with: "Test Create Question 1")
  fill_in("quiz_questions_attributes_0_answers_attributes_0_option", with: "Test Create Question 1 Answer 1")
  check("quiz_questions_attributes_0_answers_attributes_0_correct")
  fill_in("quiz_questions_attributes_0_answers_attributes_1_option", with: "Test Create Question 1 Answer 2")
  fill_in("quiz_questions_attributes_0_answers_attributes_2_option", with: "Test Create Question 1 Answer 3")

  fill_in("quiz_questions_attributes_0_content", with: "Test Create Question 2")
  fill_in("quiz_questions_attributes_1_answers_attributes_0_option", with: "Test Create Question 2 Answer 1")
  check("quiz_questions_attributes_1_answers_attributes_0_correct")
  fill_in("quiz_questions_attributes_1_answers_attributes_1_option", with: "Test Create Question 2 Answer 2")
  fill_in("quiz_questions_attributes_1_answers_attributes_2_option", with: "Test Create Question 2 Answer 3")
  
  fill_in("quiz_questions_attributes_0_content", with: "Test Create Question 3")
  fill_in("quiz_questions_attributes_2_answers_attributes_0_option", with: "Test Create Question 3 Answer 1")
  check("quiz_questions_attributes_2_answers_attributes_0_correct")
  fill_in("quiz_questions_attributes_2_answers_attributes_1_option", with: "Test Create Question 3 Answer 2")
  fill_in("quiz_questions_attributes_2_answers_attributes_2_option", with: "Test Create Question 3 Answer 3")

  click_on "Create Quiz"
end

Then("I see the quiz") do
  expect(page).to have_content("Test Create Title")
  expect(page).to have_content("Test Create Description")
  expect(page).to have_content("Test Create Question 1")
  expect(page).to have_content("Test Create Question 2")
  expect(page).to have_content("Test Create Question 3")
  expect(page).to have_content("Test Create Question 1 Answer 1")
  expect(page).to have_content("Test Create Question 2 Answer 2")
  expect(page).to have_content("Test Create Question 3 Answer 3")
end

When("I edit the question contents") do
  fill_in("quiz_questions_attributes_0_content", with: "Test Edited Question 1")
  click_on "Update Quiz"
end

Then("I no longer see the old question") do
  expect(page).not_to have_content("Test Create Question 1")
end

Then("I see the edited question") do
  expect(page).to have_content("Test Edited Question 1")
end

Given("The quiz form has {int} question fields") do |int|
  # Given('The quiz form has {float} question fields') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see another question field") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("The form has a question field filled") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I do not see the question") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I no longer see the question") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I edit the answer") do
  fill_in("quiz_questions_attributes_0_answers_attributes_0_option", with: "Test Edited Question 1 Answer 1")
  click_on "Update Quiz"
end

Then("I no longer see the old answer") do
  expect(page).not_to have_content("Test Create Question 1 Answer 1")  
end

Then("I see the edited answer") do
  expect(page).to have_content("Test Edited Question 1 Answer 1")
end

Given("The question form has {int} answer fields") do |int|
  # Given('The question form has {float} answer fields') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see another answer field") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see {int} answer fields") do |int|
  expect(page).to have_css("input", :count => int)
end

Given("The form has {int} answer fields") do |int|
  # Given('The form has {float} answer fields') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end
