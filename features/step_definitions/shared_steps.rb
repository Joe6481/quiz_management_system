# frozen_string_literal: true

Given("There are quizzes in the database") do
  #@quiz = FactoryBot.create(:quiz)

  fill_in("quiz_title", with: "Test Title")
  fill_in("quiz_description", with: "Test Description")
  fill_in("quiz_questions_attributes_0_content", with: "Test Question 1")
  fill_in("quiz_questions_attributes_0_answers_attributes_0_option", with: "Test Question 1 Answer 1")
  check("quiz_questions_attributes_0_answers_attributes_0_correct")
  fill_in("quiz_questions_attributes_0_answers_attributes_1_option", with: "Test Question 1 Answer 2")
  fill_in("quiz_questions_attributes_0_answers_attributes_2_option", with: "Test Question 1 Answer 3")

  fill_in("quiz_questions_attributes_0_content", with: "Test Question 2")
  fill_in("quiz_questions_attributes_1_answers_attributes_0_option", with: "Test Question 2 Answer 1")
  check("quiz_questions_attributes_1_answers_attributes_0_correct")
  fill_in("quiz_questions_attributes_1_answers_attributes_1_option", with: "Test Question 2 Answer 2")
  fill_in("quiz_questions_attributes_1_answers_attributes_2_option", with: "Test Question 2 Answer 3")
  
  fill_in("quiz_questions_attributes_0_content", with: "Test Question 3")
  fill_in("quiz_questions_attributes_2_answers_attributes_0_option", with: "Test Question 3 Answer 1")
  check("quiz_questions_attributes_2_answers_attributes_0_correct")
  fill_in("quiz_questions_attributes_2_answers_attributes_1_option", with: "Test Question 3 Answer 2")
  fill_in("quiz_questions_attributes_2_answers_attributes_2_option", with: "Test Question 3 Answer 3")

  click_on "Create Quiz"
end

When("I click on {string}") do |string|
  click_on string
end

Then("I see the existing quizzes") do
  expect(page).to have_content("Test Title")
  expect(page).to have_content("Test Description")
end

Then("I see the questions") do
  expect(page).to have_content("Test Question 1")
  expect(page).to have_content("Test Question 2")
  expect(page).to have_content("Test Question 3")
end

Then("I see the answer options") do
  expect(page).to have_content("Test Question 1 Answer 3")
  expect(page).to have_content("Test Question 2 Answer 2")
  expect(page).to have_content("Test Question 3 Answer 1")
end
