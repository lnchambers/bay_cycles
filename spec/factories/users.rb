FactoryBot.define do
  factory :user do
    name "User"
    password "User"
    email "UserEmail"
  end

  factory :admin, class: User do
    name "Admin"
    password "Admin"
    email "AdminEmail"
    role 1
  end
end
