Rails.application.routes.draw do
  resources :quizzes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root controller: "quizzes", action: "index"


end