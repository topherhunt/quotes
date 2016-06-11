FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| "test_user_#{n}@example.com" }
    password              "foobar01"
    password_confirmation "foobar01"
  end

  factory :quote do
    association :user
    quote "Some random quote"
    source "Topher"
    weight 1
  end
end
