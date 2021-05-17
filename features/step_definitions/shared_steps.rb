# frozen_string_literal: true

Given("There are quizzes in the database") do
  @quiz = Quiz.create(title: "Test Title", description: "Test Description")

  @question = @quiz.questions.create(content: "Test Question")

  @question.answers.create([
                             {option: "dummy", correct: "true"},
                             {option: "Test Question Answer 1 (False)", correct: false},
                             {option: "Test Question Answer 2 (False)", correct: false},
                             {option: "Test Question Answer 3 (True)", correct: true},
                           ])
end

When("I click on {string}") do |string|
  click_on string
end

Then("I see the existing quizzes") do
  expect(page).to have_content("Test Title")
  expect(page).to have_content("Test Description")
end

Then("I see a welcome message") do
  expect(page).to have_content("Hello, #{@user.name}")
end

Then("I see the quiz contents, questions and answer options") do
  expect(page).to have_content("Test Title")
  expect(page).to have_content("Test Description")
  expect(page).to have_content("Test Question")
  expect(page).to have_content("Test Question Answer 1 (False)")
  expect(page).to have_content("Test Question Answer 2 (False)")
  expect(page).to have_content("Test Question Answer 3 (True)")
end

Then("I see the correct answers") do
  expect(page).to have_css(".correct_answer")
end
