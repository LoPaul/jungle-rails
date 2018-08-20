require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {  described_class.new(
    name: "Jacket", description: "Winter jacket",
    price_cents: 2000, quantity: 1, 
    created_at: DateTime.now, updated_at: DateTime.now ) }

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq("Name can't be blank")
    end
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq("Price cents is not a number")
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq("Quantity can't be blank")
    end
    it "is not valid without a category" do
      subject.category_id = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq("Category can't be blank")
    end
end
