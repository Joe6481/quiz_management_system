# frozen_string_literal: true

Given("There are quizzes in the database") do
  @quiz = Quiz.new(id: 1, title: "Test Title", description: "Test Description").save
  @question = Question.new(id: 1, content: "Test Description", quiz_id: 1).save
  @answer1 = Answer.new(option: "Test Question Answer 1", correct: true, question_id: 1).save
  @answer2 = Answer.new(option: "Test Question Answer 2", correct: true, question_id: 1).save
  @answer3 = Answer.new(option: "Test Question Answer 3", correct: true, question_id: 1).save
end

When("I click on {string}") do |string|
  click_on string
end

Then("I see the existing quizzes") do
  expect(page).to have_content("Test Title")
  expect(page).to have_content("Test Description")
end

Then("I see the questions and answer options") do
  expect(page).to have_content("Test Question")
  expect(page).to have_content("Test Question Answer 1")
  expect(page).to have_content("Test Question Answer 2")
  expect(page).to have_content("Test Question Answer 3")
end
