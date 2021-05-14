FactoryBot.define do
  factory :question do
    content { Faker::Food.dish } # Creates a random food dish to act as a question
    quiz
  end

  factory :quiz do
    name { "John Doe" }

    # user_with_posts will create post data after the user has been created
    factory :user_with_posts do
      # posts_count is declared as a transient attribute available in the
      # callback via the evaluator
      transient do
        posts_count { 5 }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)

        # You may need to reload the record here, depending on your application
        user.reload
      end
    end
  end
end