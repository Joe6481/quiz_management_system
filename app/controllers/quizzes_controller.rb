# frozen_string_literal: true

class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[show edit update destroy]

  def index
    @quizzes = Quiz.all
    @quiz = Quiz.new

    generate_quesitons
  end

  def show; end

  def edit; end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: "'#{@quiz.title}' was successfully created."
    else
      render :edit
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: "'#{@quiz.title}' was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path, notice: "'#{@quiz.title}' was successfully destroyed."
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description,
                                 questions_attributes: [:content, :id, {answers_attributes: [:option, :correct, :id]}])
    
    # ...questions_attributes: [:content, :id, :_destroy, {answers_attributes: [:option, :correct, :id, :_destroy]}])
  end

  def generate_quesitons
    3.times do
      question = @quiz.questions.build
      3.times do
        question.answers.build
      end
    end
  end
end
