FactoryBot.define do
  factory :user do
    name "Normal Joe"
    password "normalestjoe"
    email "joe@Email.joe"
  end

  factory :admin, class: User do
    name "Super Joe"
    password "superestjoe"
    email "superjoe@email.joe"
    role 1
  end
end
