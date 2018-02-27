require "rails_helper"

describe OrderedAccessories do
  it { should belong_to(:order) }
  it { should belong_to(:accessory) }
end
