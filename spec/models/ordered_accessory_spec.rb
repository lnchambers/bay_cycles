require "rails_helper"

describe OrderedAccessory do
  it { should belong_to(:order) }
  it { should belong_to(:accessory) }
end
