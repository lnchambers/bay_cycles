FactoryBot.define do
  factory :order do
    purchaser_name "MyText"
    purchaser_address "MyText"
    status "MyText"
    user
  end
end
