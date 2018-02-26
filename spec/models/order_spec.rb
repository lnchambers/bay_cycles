require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:purchaser_name) }
  it { should validate_presence_of(:purchaser_address) }
  it { should validate_presence_of(:item_name) }
  it { should validate_presence_of(:item_quantity) }
  it { should validate_presence_of(:item_price) }
  it { should validate_presence_of(:status) }
end
