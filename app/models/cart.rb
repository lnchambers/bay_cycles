class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_accessory(accessory)
    @contents[accessory.to_s] = @contents[accessory.to_s].to_i + 1
  end

  def decrease_quantity(accessory)
    @contents[accessory.to_s] = @contents[accessory.to_s].to_i - 1
  end

  def remove_accessory(accessory)
    @contents.delete(accessory.to_s)
  end

  def total_value
    values = []
    @contents.each_pair do |accessory, quantity|
      values << Accessory.find(accessory).price * quantity
    end
    values.sum
  end
end
