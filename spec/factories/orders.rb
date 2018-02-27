FactoryBot.define do
  factory :order do
    purchaser_name "MyText"
    purchaser_address "MyText"
    status "Ordered"
    user
  end
end
