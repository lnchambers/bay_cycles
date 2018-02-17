FactoryBot.define do
  factory :user do
    name "User"
    password "User"
  end

  factory :admin, class: User do
    name "Admin"
    password "Admin"
    role 1
  end
end
